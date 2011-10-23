/************************************************************************

	IMPORTANT NOTE : this file contains two clearly delimited sections : 
	the ARCHITECTURE section (in two parts) and the USER section. Each section 
	is governed by its own copyright and license. Please check individually 
	each section for license and copyright information.
*************************************************************************/

/*******************BEGIN ARCHITECTURE SECTION (part 1/2)****************/

/************************************************************************
    FAUST Architecture File
	Copyright (C) 2003-2011 GRAME, Centre National de Creation Musicale
    ---------------------------------------------------------------------
    This Architecture section is free software; you can redistribute it 
    and/or modify it under the terms of the GNU General Public License 
	as published by the Free Software Foundation; either version 3 of 
	the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License 
	along with this program; If not, see <http://www.gnu.org/licenses/>.

	EXCEPTION : As a special exception, you may create a larger work 
	that contains this FAUST architecture section and distribute  
	that work under terms of your choice, so long as this FAUST 
	architecture section is not modified. 


 ************************************************************************
 ************************************************************************/


/* link with  */
/* link with : "" */
#include <stdlib.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <math.h>
#include <errno.h>
#include <time.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <fcntl.h>
#include <pwd.h>
#include <sys/types.h>
#include <assert.h>
#include <pthread.h>
#include <sys/wait.h>
#include <list>

#include <iostream>

// Stuff added here. -Kjetil
#include "freeverb/Components/revmodel.h"




using namespace std;

#include <map>

using namespace std;

// On Intel set FZ (Flush to Zero) and DAZ (Denormals Are Zero)
// flags to avoid costly denormals
#ifdef __SSE__
    #include <xmmintrin.h>
    #ifdef __SSE2__
        #define AVOIDDENORMALS _mm_setcsr(_mm_getcsr() | 0x8040)
    #else
        #define AVOIDDENORMALS _mm_setcsr(_mm_getcsr() | 0x8000)
    #endif
#else
    #define AVOIDDENORMALS 
#endif

struct Meta : map<const char*, const char*>
{
    void declare (const char* key, const char* value) { (*this)[key]=value; }
};



float*          gBuffer = 0;        // a buffer of NV*VSize samples

unsigned int    COUNT   = 2000;     // number of measures
unsigned int    NV      = 4096;     // number of vectors in BIG buffer (should exceed cache)
unsigned int    ITER    = 10;       // number of iterations per measure
unsigned int    VSIZE   = 4096;     // size of a vector in samples
unsigned int    IDX     = 0;        // current vector number (0 <= VIdx < NV)


//inline void *aligned_calloc(size_t nmemb, size_t size) { return (void*)((unsigned)(calloc((nmemb*size)+15,sizeof(char)))+15 & 0xfffffff0); }
//inline void *aligned_calloc(size_t nmemb, size_t size) { return (void*)((size_t)(calloc((nmemb*size)+15,sizeof(char)))+15 & ~15); }



// g++ -Wall -O3 -lm -lpthread -lasound `gtk-config --cflags --libs` test.cpp -o test


//-------------------------------------------------------------------
// Generic min and max using c++ inline
//-------------------------------------------------------------------

inline int 		max (unsigned int a, unsigned int b) { return (a>b) ? a : b; }
inline int 		max (int a, int b) 			{ return (a>b) ? a : b; }

inline long 	max (long a, long b) 		{ return (a>b) ? a : b; }
inline long 	max (int a, long b) 		{ return (a>b) ? a : b; }
inline long 	max (long a, int b) 		{ return (a>b) ? a : b; }

inline float 	max (float a, float b) 		{ return (a>b) ? a : b; }
inline float 	max (int a, float b) 		{ return (a>b) ? a : b; }
inline float 	max (float a, int b) 		{ return (a>b) ? a : b; }
inline float 	max (long a, float b) 		{ return (a>b) ? a : b; }
inline float 	max (float a, long b) 		{ return (a>b) ? a : b; }

inline double 	max (double a, double b) 	{ return (a>b) ? a : b; }
inline double 	max (int a, double b) 		{ return (a>b) ? a : b; }
inline double 	max (double a, int b) 		{ return (a>b) ? a : b; }
inline double 	max (long a, double b) 		{ return (a>b) ? a : b; }
inline double 	max (double a, long b) 		{ return (a>b) ? a : b; }
inline double 	max (float a, double b) 	{ return (a>b) ? a : b; }
inline double 	max (double a, float b) 	{ return (a>b) ? a : b; }


inline int 		min (int a, int b) 			{ return (a<b) ? a : b; }

inline long 	min (long a, long b) 		{ return (a<b) ? a : b; }
inline long 	min (int a, long b) 		{ return (a<b) ? a : b; }
inline long 	min (long a, int b) 		{ return (a<b) ? a : b; }

inline float 	min (float a, float b) 		{ return (a<b) ? a : b; }
inline float 	min (int a, float b) 		{ return (a<b) ? a : b; }
inline float 	min (float a, int b) 		{ return (a<b) ? a : b; }
inline float 	min (long a, float b) 		{ return (a<b) ? a : b; }
inline float 	min (float a, long b) 		{ return (a<b) ? a : b; }

inline double 	min (double a, double b) 	{ return (a<b) ? a : b; }
inline double 	min (int a, double b) 		{ return (a<b) ? a : b; }
inline double 	min (double a, int b) 		{ return (a<b) ? a : b; }
inline double 	min (long a, double b) 		{ return (a<b) ? a : b; }
inline double 	min (double a, long b) 		{ return (a<b) ? a : b; }
inline double 	min (float a, double b) 	{ return (a<b) ? a : b; }
inline double 	min (double a, float b) 	{ return (a<b) ? a : b; }


inline int		lsr (int x, int n)			{ return int(((unsigned int)x) >> n); }


bool setRealtimePriority ()
{
    struct passwd *         pw;
    int                     err;
    uid_t                   uid;
    int                     policy;
    struct sched_param      param;

    uid = getuid ();
    pw = getpwnam ("root");
    setuid (pw->pw_uid);

    pthread_getschedparam(pthread_self(), &policy, &param);
    policy = SCHED_RR;
    param.sched_priority = 50;
    err = pthread_setschedparam(pthread_self(), policy, &param);

    setuid (uid);
    return (err != -1);
}

#include <sys/time.h>

double mysecond()
{
        struct timeval tp;
        struct timezone tzp;
        int i;

        i = gettimeofday(&tp,&tzp);
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

/******************************************************************************
*******************************************************************************

							       VECTOR INTRINSICS

*******************************************************************************
*******************************************************************************/






/******************************************************************************
*******************************************************************************

			ABSTRACT USER INTERFACE

*******************************************************************************
*******************************************************************************/

class UI
{
	bool	fStopped;
public:

	UI() : fStopped(false) {}
	virtual ~UI() {}

	virtual void addButton(const char* label, float* zone) = 0;
	virtual void addToggleButton(const char* label, float* zone) = 0;
	virtual void addCheckButton(const char* label, float* zone) = 0;
	virtual void addVerticalSlider(const char* label, float* zone, float init, float min, float max, float step) = 0;
	virtual void addHorizontalSlider(const char* label, float* zone, float init, float min, float max, float step) = 0;
	virtual void addNumEntry(const char* label, float* zone, float init, float min, float max, float step) = 0;

        // -- passive widgets

        virtual void addNumDisplay(const char* label, float* zone, int precision) = 0;
        virtual void addTextDisplay(const char* label, float* zone, char* names[], float min, float max) = 0;
        virtual void addHorizontalBargraph(const char* label, float* zone, float min, float max) = 0;
	virtual void addVerticalBargraph(const char* label, float* zone, float min, float max) = 0;

	virtual void openFrameBox(const char* label) = 0;
        virtual void openTabBox(const char* label) = 0;
        virtual void openHorizontalBox(const char* label) = 0;
        virtual void openVerticalBox(const char* label) = 0;

        virtual void closeBox() = 0;

        virtual void run() = 0;

	void stop()	{ fStopped = true; }
	bool stopped() 	{ return fStopped; }

    virtual void declare(float* zone, const char* key, const char* value) {}
};




/******************************************************************************
*******************************************************************************

								DSP

*******************************************************************************
*******************************************************************************/



//----------------------------------------------------------------
//  definition du processeur de signal
//----------------------------------------------------------------

class dsp {
 protected:
	int fSamplingFreq;
 public:
	dsp() {}
	virtual ~dsp() {}
	virtual int getNumInputs() 										= 0;
	virtual int getNumOutputs() 									= 0;
	virtual void buildUserInterface(UI* interface) 					= 0;
	virtual void init(int samplingRate) 							= 0;
 	virtual void compute(int len, float** inputs, float** outputs) 	= 0;
};
		
/********************END ARCHITECTURE SECTION (part 1/2)****************/

/**************************BEGIN USER SECTION **************************/
		
#ifndef FAUSTFLOAT
#define FAUSTFLOAT float
#endif  

typedef long double quad;
/* link with  */


class SIG0 {
	
  private:
	
	
  public:
	int getNumInputs() {
		return 0;
		
	}
	int getNumOutputs() {
		return 1;
		
	}
	int getInputRate(int channel) {
		switch (channel) {
			default: {
				return -1;
				
			}
			
		}
		
	}
	int getOutputRate(int channel) {
		switch (channel) {
			case 0: {
				return 0;
				
			}
			default: {
				return -1;
				
			}
			
		}
		
	}
	
	void instanceInitSIG0(int samplingFreq) {
		
	}
	
	void fillSIG0(int count, float* output) {
		for (int i = 0; (i < count); i = (i + 1)) {
			output[i] = 0.f;
			
		}
		
	}
};

SIG0* newSIG0() { return (SIG0*) new SIG0(); }
void deleteSIG0(SIG0* dsp) { delete dsp; }

float rintf(float dummy0);
float sinf(float dummy0);

class mydsp : public dsp {
	
  private:
	
	int iRec14[2];
	int iRec13[2];
	float fRec12[2];
	float ftbl1[8192];
	float ftbl0[8192];
	int iRec10[2];
	int iRec9[2];
	int iRec8[2];
	int iRec7[2];
	int iRec6[2];
	int iRec5[2];
	float fRec4[2];
	int iRec3[2];
	float fRec2[2];
	int iRec1[2];
	int iRec0[2];
	FAUSTFLOAT fhslider0;
	FAUSTFLOAT fhslider1;
	FAUSTFLOAT fhslider2;
	
  public:
	
	void static metadata(Meta* m) { 
	}

	virtual ~mydsp() {
		destroy();
	}

	void destroy() {
		
	}
	virtual int getNumInputs() {
		return 2;
		
	}
	virtual int getNumOutputs() {
		return 2;
		
	}
	virtual int getInputRate(int channel) {
		switch (channel) {
			case 0: {
				return 1;
				
			}
			default: {
				return -1;
				
			}
			
		}
		
	}
	virtual int getOutputRate(int channel) {
		switch (channel) {
			case 0: {
				return 1;
				
			}
			default: {
				return -1;
				
			}
			
		}
		
	}
	
	static void classInit(int samplingFreq) {
		
	}
	
	virtual void instanceInit(int samplingFreq) {
		fSamplingFreq = samplingFreq;
		fhslider0 = FAUSTFLOAT(1);
		fhslider1 = FAUSTFLOAT(4);
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec0[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec1[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			fRec2[i] = 0.f;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec3[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			fRec4[i] = 0.f;
			
		}
		fhslider2 = FAUSTFLOAT(1);
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec5[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec6[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec7[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec8[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec9[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec10[i] = 0;
			
		}
		SIG0* sig0 = newSIG0();
		sig0->instanceInitSIG0(samplingFreq);
		sig0->fillSIG0(8192, ftbl0);
		sig0->instanceInitSIG0(samplingFreq);
		sig0->fillSIG0(8192, ftbl1);
		for (int i = 0; (i < 2); i = (i + 1)) {
			fRec12[i] = 0.f;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec13[i] = 0;
			
		}
		for (int i = 0; (i < 2); i = (i + 1)) {
			iRec14[i] = 0;
			
		}
		deleteSIG0(sig0);
		
	}

  // global data inserted here. -Kjetil.
  revmodel *das_revmodel;

	virtual void init(int samplingFreq) {
		classInit(samplingFreq);
		instanceInit(samplingFreq);

                // inserted stuff here. -Kjetil
                das_revmodel = new revmodel();
	}
	
	virtual void buildUserInterface(UI* interface) {
		interface->openVerticalBox("am_pitchshift.dsp_generated");
		interface->addHorizontalSlider("Buffer size", &fhslider1, 4.f, 1.f, 7.f, 1.f);
		interface->addHorizontalSlider("Pitch", &fhslider2, 1.f, 0.25f, 4.f, 0.025f);
		interface->addHorizontalSlider("Volume", &fhslider0, 1.f, 0.1f, 6.f, 0.025f);
		interface->closeBox();
		
	}


  
  virtual void compute(int sample_count, FAUSTFLOAT** inputs, FAUSTFLOAT** outputs) {
    das_revmodel->setmode(0); //non-freeze
    das_revmodel->setdamp(0.99);
    das_revmodel->setwet(0.99);
    das_revmodel->setdry(0.0);
    das_revmodel->setroomsize(0.99*0.28 + 0.7);
    das_revmodel->setwidth(0.99);
    
    /* Connect to audio ports and run. */
    
    das_revmodel->processreplace(inputs[0],inputs[1],
                                 outputs[0],outputs[1],
                                 sample_count,
                                 1);
    
  }


	virtual void compute_org(int count, FAUSTFLOAT** inputs, FAUSTFLOAT** outputs) {
		FAUSTFLOAT* input0 = inputs[0];
		FAUSTFLOAT* output0 = outputs[0];
		float fSlow0 = float(fhslider0);
		int iSlow1 = int(float(fhslider1));
		int iSlow2 = ((1 << (6 + iSlow1)) - 1);
		int iSlow3 = (1 & iSlow2);
		float fSlow4 = float(float(fhslider2));
		int iSlow5 = int(rintf((65536.f * fSlow4)));
		int iSlow6 = (1 << (5 + iSlow1));
		int iSlow7 = (1 + iSlow6);
		int iSlow8 = (2 + iSlow6);
		int iSlow9 = (iSlow6 - 1);
		float fSlow10 = (3.14159f / float(iSlow6));
		int iSlow11 = int((0.5f * float(iSlow6)));
		for (int i = 0; (i < count); i = (i + 1)) {
			int iTemp0 = int(iRec14[1]);
			iRec0[0] = (iTemp0?((1 + iRec0[1]) & iSlow2):iSlow3);
			iRec1[0] = (iTemp0?iRec1[1]:-1);
			fRec2[0] = (iTemp0?fRec2[1]:0.5f);
			int iTemp1 = (1 + iRec3[1]);
			int iTemp2 = int((iTemp1 > 14));
			iRec3[0] = (iTemp0?(iTemp2?0:iTemp1):1);
			fRec4[0] = (iTemp0?fRec4[1]:0.f);
			int iTemp3 = int((iSlow5 + iRec5[1]));
			iRec5[0] = iTemp3;
			int iTemp4 = (iTemp3 >> 16);
			iRec6[0] = (iTemp4 & iSlow2);
			iRec7[0] = (iTemp3 & 65535);
			iRec8[0] = iRec8[1];
			iRec9[0] = iRec9[1];
			iRec10[0] = iRec10[1];
			float fTemp5 = float(input0[i]);
			ftbl0[0] = fTemp5;
			int iTemp6 = (iRec6[1] + iSlow6);
			int iTemp7 = (iTemp6 & iSlow2);
			float fTemp8 = ftbl0[iTemp7];
			float fTemp9 = float(iRec7[1]);
			int iTemp10 = ((iRec6[1] + iSlow7) & iSlow2);
			float fTemp11 = ftbl0[iTemp10];
			int iTemp12 = ((iRec6[1] + iSlow8) & iSlow2);
			float fTemp13 = ftbl0[iTemp12];
			int iTemp14 = ((iRec6[1] + iSlow9) & iSlow2);
			float fTemp15 = ftbl0[iTemp14];
			float fTemp16 = ftbl0[iRec6[1]];
			int iTemp17 = ((1 + iRec6[1]) & iSlow2);
			float fTemp18 = ftbl0[iTemp17];
			int iTemp19 = ((2 + iRec6[1]) & iSlow2);
			float fTemp20 = ftbl0[iTemp19];
			int iTemp21 = ((iRec6[1] - 1) & iSlow2);
			float fTemp22 = ftbl0[iTemp21];
			ftbl1[iRec0[1]] = fTemp5;
			float fTemp23 = ftbl1[iTemp7];
			float fTemp24 = ftbl1[iTemp10];
			float fTemp25 = ftbl1[iTemp12];
			float fTemp26 = ftbl1[iTemp14];
			float fTemp27 = (fTemp23 + (7.62935e-06f * (fTemp9 * ((fTemp24 + (1.52587e-05f * (fTemp9 * (((1.52587e-05f * (((fTemp25 + (3.f * (fTemp23 - fTemp24))) - fTemp26) * fTemp9)) + ((2.f * fTemp26) + (4.f * fTemp24))) - (fTemp25 + (5.f * fTemp23)))))) - fTemp26))));
			float fTemp28 = (fRec2[1] + fRec4[1]);
			float fTemp29 = ftbl1[iRec6[1]];
			float fTemp30 = ftbl1[iTemp17];
			float fTemp31 = ftbl1[iTemp19];
			float fTemp32 = ftbl1[iTemp21];
			float fTemp33 = (fTemp29 + (7.62935e-06f * (fTemp9 * ((fTemp30 + (1.52587e-05f * (fTemp9 * (((1.52587e-05f * (fTemp9 * ((fTemp31 + (3.f * (fTemp29 - fTemp30))) - fTemp32))) + ((2.f * fTemp32) + (4.f * fTemp30))) - (fTemp31 + (5.f * fTemp29)))))) - fTemp32))));
			float fTemp34 = (0.5f * (1.f + sinf((fSlow10 * float((((iRec6[1] + iSlow11) - iRec0[1]) & iSlow2))))));
			float fTemp35 = (0.0666667f * (fTemp34 - fRec2[1]));
			float fTemp36 = (fRec2[1] + fTemp35);
			float fRec11 = (iTemp0?(iTemp2?((fTemp36 * fTemp27) + ((1.f - fTemp36) * fTemp33)):((fTemp27 * fTemp28) + (fTemp33 * (0.f - (fTemp28 - 1.f))))):(0.5f * ((fTemp8 + (7.62935e-06f * (fTemp9 * ((fTemp11 + (1.52587e-05f * (fTemp9 * (((1.52587e-05f * (fTemp9 * ((fTemp13 + (3.f * (fTemp8 - fTemp11))) - fTemp15))) + ((2.f * fTemp15) + (4.f * fTemp11))) - (fTemp13 + (5.f * fTemp8)))))) - fTemp15)))) + (fTemp16 + (7.62935e-06f * (fTemp9 * ((fTemp18 + (1.52587e-05f * (fTemp9 * (((1.52587e-05f * (fTemp9 * ((fTemp20 + (3.f * (fTemp16 - fTemp18))) - fTemp22))) + ((2.f * fTemp22) + (4.f * fTemp18))) - (fTemp20 + (5.f * fTemp16)))))) - fTemp22)))))));
			fRec12[0] = (iTemp0?(iTemp2?fTemp34:fRec12[1]):fRec12[1]);
			iRec13[0] = (iTemp0?(iTemp2?iRec6[1]:iRec13[1]):iRec13[1]);
			iRec14[0] = 1;
			output0[i] = FAUSTFLOAT((fSlow0 * fRec11));
			iRec0[1] = iRec0[0];
			iRec1[1] = iRec1[0];
			fRec2[1] = fRec2[0];
			iRec3[1] = iRec3[0];
			fRec4[1] = fRec4[0];
			iRec5[1] = iRec5[0];
			iRec6[1] = iRec6[0];
			iRec7[1] = iRec7[0];
			iRec8[1] = iRec8[0];
			iRec9[1] = iRec9[0];
			iRec10[1] = iRec10[0];
			fRec12[1] = fRec12[0];
			iRec13[1] = iRec13[0];
			iRec14[1] = iRec14[0];
			
		}
		
	}

	
};


/***************************END USER SECTION ***************************/

/*******************BEGIN ARCHITECTURE SECTION (part 2/2)***************/
					
mydsp	DSP;


#if 0

static __inline__ unsigned long long int rdtsc(void)
{
  unsigned long long int x;
     __asm__ volatile (".byte 0x0f, 0x31" : "=A" (x));
     return x;
}

#endif

/**
 * Bench by calling COUNT times the compute() method for
 * the computation of vsize samples
 */

#define MEGABYTE 1048576.0

void statistic(const char* name, double* timing)
{
    double lo, hi, tot;
    double mega =  double(VSIZE*ITER)/MEGABYTE; // mega samples
    // skip first 10 values to avoid cache bias ???
    lo = hi = tot = mega/(timing[11] - timing[10]);
    for (int i = 11; i<COUNT; i++) {
        double delta = mega/(timing[i] - timing[i-1]);
        if (delta < lo) {
            lo = delta;
        } else if (delta > hi) {
            hi = delta;
        }
        tot += delta;
    }

    cout << '\t' << hi
         << '\t' << hi*4*DSP.getNumInputs() << '\t' << "MB/s inputs"
         << '\t' << hi*4*DSP.getNumOutputs() << '\t' << "MB/s outputs"
         << '\t' << tot/(COUNT-11)
         << '\t' << lo
         << endl; 
} 

void allocBuffer()
{
    unsigned int BSIZE = NV * VSIZE;
    gBuffer = (float*) calloc (BSIZE, sizeof(float));
    
    int R0_0 = 0;
    for (int j = 0; j < BSIZE; j++) {
        int R0temp0 = (12345 + (1103515245 * R0_0));
        gBuffer[j] = 4.656613e-10f*R0temp0;
        R0_0 = R0temp0;
    }
}

float* nextVect()
{
    IDX = (1+IDX)%NV;
    return &gBuffer[IDX*VSIZE];
}

void bench(const char* name)
{

    int numInChan = DSP.getNumInputs();
    int numOutChan = DSP.getNumOutputs();

    assert (numInChan < 256);
    assert (numOutChan < 256);

    float*  inChannel[256];
    float*  outChannel[256];

    // allocate input buffers (initialized with white noise)
    allocBuffer();

    // allocate output channels (not initialized)
    for (int i = 0; i < numOutChan; i++) outChannel[i] = (float*) calloc (VSIZE, sizeof(float));

    // init the dsp with a resoneable sampling rate)
    DSP.init(48000);
    double* timing = (double*) calloc (COUNT, sizeof(double));

    for (int i = 0; i<COUNT; i++) {
        timing[i] = mysecond();
        for (int k = 0; k<ITER; k++) {
            // allocate new input buffers to avoid L2 cache
            for (int c=0; c<numInChan; c++) { inChannel[c] = nextVect(); }
            DSP.compute(VSIZE,inChannel,outChannel);
        }
    }

    statistic(name, timing);
}

//-------------------------------------------------------------------------
// 									MAIN
//-------------------------------------------------------------------------

// lopt : Scan Command Line long int Arguments

long lopt (int argc, char *argv[], const char* longname, const char* shortname, long def)
{
	for (int i=2; i<argc; i++)
		if ( strcmp(argv[i-1], shortname) == 0 || strcmp(argv[i-1], longname) == 0 )
			return atoi(argv[i]);
	return def;
}


int main(int argc, char *argv[] )
{
    AVOIDDENORMALS;
    VSIZE = lopt(argc, argv, "--vector-size", "-vec", 4096);
    NV = lopt(argc, argv, "--num-vector", "-n", 20000);
    COUNT = lopt(argc, argv, "--count", "-c", 1000);
    ITER = lopt(argc, argv, "--iteration", "-i", 10);
    //setRealtimePriority();
  	bench(argv[0]);
  	return 0;
}


/********************END ARCHITECTURE SECTION (part 2/2)****************/



