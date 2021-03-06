#ifndef __SOURCE_SAMREAD_H__
#define __SOURCE_SAMREAD_H__

#include <bitset>
#include <cmath>
#include <ctime>
#include <errno.h>
#include <fcntl.h>
#include <fstream>
#include <ios>
#include <iostream>
#include <map>
#include <math.h>
#include <sstream>
#include <stack>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <sys/mman.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unordered_map>
#include <unistd.h>

using namespace std;

class SamRead{
 public:
  string name;
  int flag;
  bool FlagBits[16];
  string chr;
  int pos;
  int mapQual;
  string cigar;
  string seq;
  string qual;
  string RefSeq;
  string originalSeq;
  string originalQual;
  string cigarString;
  string strand;
  float StrandBias;
  string strands;
  int forward;
  int reverse;
  vector<int> alignments;
  vector<int> Positions;
  vector<string> ChrPositions;
  vector<long> MutAltCounts;
  vector<long> MutRefCounts;
  vector<long> MutHashListCounts;
  vector<vector <long> > RefAltCounts;
  vector<vector <long> > RefRefCounts;
  vector<string> AltKmers;
  vector<string> RefKmers;
  bool first; // = true
  bool combined; // = false;
  vector<bool> PeakMap;

  void createPeakMap();
  void parse(string read);
  void getRefSeq();
  void processCigar();
  void parseMutations( char *argv[] );
  void write();
  void writeVertical();
  void writetofile(ofstream &out);
  void flipRead();
  void LookUpKmers();
  void FixTandemRef();
  int CheckParentCov(int &mode);

 private:
  //LMAO
};

#endif // __SOURCE_SAMREAD_H__
