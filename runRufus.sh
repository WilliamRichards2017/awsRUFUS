#!/bin/bash

# This is a rather minimal example Argbash potential
# Example taken from http://argbash.readthedocs.io/en/stable/example.html


# ARG_OPTIONAL_SINGLE([subject],[s],[generator file containing the subject of interest])
# ARG_OPTIONAL_SINGLE([ref],[r],[file path to the desired reference file])
# ARG_OPTIONAL_SINGLE([threads],[t],[number of threads to use])
# ARG_OPTIONAL_SINGLE([kmersize],[k],[size of Khmer to use])
# ARG_OPTIONAL_SINGLE([min],[m],[overwrites the minimum k-mer count to call variant])
# ARG_POSITIONAL_INF([controls],[generator files containing the control subjects],[0])



# ARG_HELP([The general script's help msg])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.5.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate
RDIR=/home/ubuntu/RUFUS

die()
{
    local _ret=$2
    test -n "$_ret" || _ret=1
    test "$_PRINT_HELP" = yes && print_help >&2
    echo "$1" >&2
    exit ${_ret}
}

begins_with_short_option()
{
    local first_option all_short_options
    all_short_options='srtkmh'
    first_option="${1:0:1}"
    test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}


# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_controls=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_subject=
_arg_ref=
_arg_threads=
_arg_kmersize=
_arg_min=
_arg_refhash=

print_help ()
{
    printf "%s\n" "The general script's help msg"
    printf 'Usage: %s [-s|--subject <arg>] [-r|--ref <arg>] [-t|--threads <arg>] [-k|--kmersize <arg>] [-m|--min <arg>] [-h|--help] [<controls-1>] ... [<controls-n>] ...\n' "$0"
    printf "\t%s\n" "-c, --controls: bam files containing the control subjects"
    printf "\t%s\n" "-s,--subject: bam file containing the subject of interest (no default)"
    printf "\t%s\n" "-r,--ref: file path to the desired reference file (no default)"
    printf "\t%s\n" "-t,--threads: number of threads to use (no default)"
    printf "\t%s\n" "-f,--refhash: File containing reference hashList (no default)"
    printf "\t%s\n" "-k,--kmersize: size of Khmer to use (no default)"
    printf "\t%s\n" "-m,--min: overwrites the minimum k-mer count to call variant (no default)"
    printf "\t%s\n" "-h,--help: HELP!!!!!!!!!!!!!!!"
}

parse_commandline ()
{
    while test $# -gt 0
    do
	_key="$1"
	case "$_key" in
	    -s|--subject)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_subject="$2"
		shift
		;;
	    --subject=*)
		_arg_subject="${_key##--subject=}"
		;;
	    -s*)
		_arg_subject="${_key##-s}"
		;;
	    -r|--ref)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_ref="$2"
		shift
		;;
	    --ref=*)
		_arg_ref="${_key##--ref=}"
		;;
	    -r*)
		_arg_ref="${_key##-r}"
		;;
	    -t|--threads)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_threads="$2"
		shift
		;;
	    --threads=*)
		_arg_threads="${_key##--threads=}"
		;;
	    -t*)
		_arg_threads="${_key##-t}"
		;;
            -f|--refhash)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_refhash="$2"
                shift
                ;;
            --refhash=*)
                _arg_refheash="${_key##--threads=}"
                ;;
            -f*)
                _arg_refhash="${_key##-t}"
                ;;
	    -k|--kmersize)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_kmersize="$2"
		shift
		;;
	    --kmersize=*)
		_arg_kmersize="${_key##--kmersize=}"
		;;
	    -k*)
		_arg_kmersize="${_key##-k}"
		;;
	    -m|--min)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_min="$2"
		shift
		;;
	    --min=*)
		_arg_min="${_key##--min=}"
		;;
	    -m*)
		_arg_min="${_key##-m}"
		;;
	    -h|--help)
		print_help
		exit 0
		;;
	    -h*)
		print_help
		exit 0
		;;
	    *)
		_positionals+=("$1")
		;;

	        esac
	shift
	done
}


assign_positional_args ()
{
    _positional_names=()
    _our_args=$((${#_positionals[@]} - ${#_positional_names[@]}))
    for ((ii = 0; ii < _our_args; ii++))
    do
	_positional_names+=("_arg_controls[$((ii + 0))]")
	done

    for (( ii = 0; ii < ${#_positionals[@]}; ii++))
    do
	eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
	done
}

parse_commandline "$@"
assign_positional_args
# [ <-- needed because of Argbash


################__THREE_FINGERED_CLAW_TECHNIQUE__###################
## Thanks to the noble efforts of the Clan of the White Lotus,     #
## these 3 functions originate during the late thirteenth century. # 
## The original author, William Baxter, explained that these       #
## three functions took 15 years to boil down to what they are     #
                                                                   #
yell() { echo "$0: $*" >&2; }                                      #
barf() { yell "$*"; exit 111; }                                    #
safe() { "$@" || barf "cannot $*"; }                               #
                                                                   #
####################################################################

##honestly probs dont want this, what if something stupid crashes?
#set -e
#####

###############__PRINTING_OUT_ARG_BASH_VALUES__##############
#echo "Value of --subject: $_arg_subject"                    #
#echo "Value of --controls:"                                 #
#for each in "${_arg_controls[@]}"                           #
#do                                                          #
#  echo "$each"                                              #
#done                                                        #
#echo "Value of --threads: $_arg_threads"                    #
#echo "Value of --kmersize: $_arg_kmersize"                  #
#echo "Value of --ref: $_arg_ref"                            #
#echo "Value of --minCount $_arg_min"                        #
#############################################################


#########__COPY_CONTROLS_TO_PARENT_ARRAY__################
new_array=()
for value in "${_arg_controls[@]}"
do
    [[ $value != --controls ]] && new_array+=($value)
done
ParentsTemp=("${new_array[@]}")
unset new_array

new_array=()
for value in "${ParentsTemp[@]}"
do 
    [[ $value != -c ]] && new_array+=($value)
done
Parents=("${new_array[@]}")
unset new_arary
unset ParentsTemp
##########################################################


_arg_ref_cat="${_arg_ref%.*}"

echo "arg ref without fa is" "$_arg_ref_cat"



###############__CHECK_IF_ALL_REFERENCE_FILES_EXIST__#####################
if [[ ! -e "$_arg_ref".sa ]] && [[ ! -e "$_arg_ref_cat".sa ]]
then
    echo "Reference file not built for BWA" 
    echo "this program requires the existence of the file" "$_arg_ref".sa
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".bwt ]] && [[ ! -e "$_arg_ref_cat".bwt ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".bwt
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".pac ]] && [[ ! -e "$_arg_ref_cat".pac ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".pac
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".amb ]] && [[ ! -e "$_arg_ref_cat".amb ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".amb
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".ann ]] && [[ ! -e "$_arg_ref_cat".ann ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".ann
    echo "Killing run with non-zero status"
    kill -9 $$
fi
###########################################################################

refFileName=$(basename "$parent")
refExtension="${refFileName##*.}"

if [[ "$refExtension" != fa ]] && [[ -e "$_arg_ref".fa ]] 
then 
    _arg_ref="$_arg_ref".fa
elif [[ "$refExtension" != fasta ]] && [[ -e "$_arg_ref".fasta ]]
then
    _arg_ref="$_arg_ref".fasta
fi

if [[ ! -e "$_arg_ref" ]]
then
    echo "cannot find reference file " "$_arg_ref"
    echo "tried extensions: "
    echo "no extension "
    echo ".fa"
    echo ".fasta"
    echo "killing run with non-zero exit status"
    kill -9 $$
fi
if [[ -e "$_arg_ref_cat".sa ]]
then 
    _arg_ref_bwa=$_arg_ref_cat
else
    _arg_ref_bwa=$_arg_ref
fi


echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "Final reference path being used is" "$_arg_ref"
echo "Final bwa reference path being used is" "$_arg_ref_bwa"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"



#########__CREATE_ALL_GENERATOR_FILES_AND_VARIABLES__#############
ProbandFileName=$(basename "$_arg_subject")
ProbandExtension="${ProbandFileName##*.}"
samtools=$RDIR/bin/samtools/samtools
echo "proband extension is $ProbandExtension"

if [[ "$ProbandExtension" != "bam" ]] || [[ ! -e "$_arg_subject" ]] && [[ "$ProbandExtension" != "generator" ]]
then 
    echo "The proband bam/generator file" "$_arg_subject" " was not provided or does not exist; killing run with non-zero exit status"
    kill -9 $$
elif [[ "$ProbandExtension" = "bam" ]]
then
    echo "you provided the proband bam file" "$_arg_subject"
    ProbandGenerator="$ProbandFileName".generator
    echo "$samtools view -F 3328 $_arg_subject" > "$ProbandGenerator"
elif [[ "$ProbandExtension" = "generator" ]]
then
    echo "you provided the proband bam file" "$_arg_subject"
    ProbandGenerator="$ProbandFileName"
else 
    echo "unknown error during generator generation, killing run with non-zero exit status"
fi

ParentGenerators=()
ParentFileNames=""
space=" "

for parent in "${Parents[@]}"
do 
    parentFileName=$(basename "$parent")
    ParentFileNames=$ParentFileNames$space$parent
    echo "parent file name is" "$parentFileName"
    parentExtension="${parentFileName##*.}"
    echo "parent file extension name is" "$parentExtension"

    if [[ "$parentExtension" != "bam" ]]  && [[ "$parentExtension" != "generator" ]]
    then
	echo "The control bam/generator file" "$parent" " was not provided, or does not exist; killing run with non-zero exit status"
	kill -9 $$
    elif [[ "$parentExtension" = "bam" ]]
    then
	    parentGenerator="$parentFileName".generator
	        ParentGenerators+=("$parentGenerator")
		    echo "$samtools view -F 3328 $parent" > "$parentGenerator"
		        echo "You provided the control bam file" "$parent"
    elif [[ "$parentExtension" = "generator" ]]
    then
	parentGenerator="$parentFileName"
        ParentGenerators+=("$parentGenerator")
	echo "You provided the control bam file" "$parent"

    fi
done
#################################################################


################__COPY_ARG_BASH_VARIABLES_TO_SCRIPT_VARIABLES__##################

K=$_arg_kmersize
Threads=$_arg_threads
ref=$_arg_ref
#################################################################################

if [[ -z "$K" ]]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "kmer size ([-k|kmersize]) was not provided, killing run with non-zero exit status"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$

fi

if [[ -z "$Threads" ]]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "number of threads ([-t|--threads]) was not provided, killing run with non-zero exit status"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$
fi

if [[ -z "$ref" ]]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "reference file ([-r|--ref]) was not provided, killing run with non-zero exit status"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$

fi


###################__PRINT_VARIABLES_USED__######################################
echo "~~~~~~~~~~~~ printing out paramater values used in script ~~~~~~~~~~~~~~~~"
echo "value of ProbandGenerator $ProbandGenerator"
echo "Value of ParentGenerators:"
for parent  in "${ParentGenerators[@]}"
do
  echo " $parent"
done
echo "Value of K is: $K"
echo "Value of Threads is: $Threads"
echo "value of ref is: $ref"
echo "value of min is: $min" 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#################################################################################


if [ -z "$_arg_refhash" ]
then
    echo "Did not provide refHash"
else
    echo "privided refhash of: " "$_arg_refhash"
fi

#####__CHECK_IF_MIN_IS_PROVIDED__#####
if [ -z "$_arg_min" ]
then
      echo "\$_arg_min is empty"
else
      echo "\$_arg_min is NOT empty"
      MutantMinCov=$_arg_min
fi

echo "_arg_min is $_arg_min"
echo "MutantMinCov is $MutantMinCov"
######################################


############__BUILD_JHASH_STRING__################
parentsString=""
space=" "
jhash=".Jhash"

echo "Building parentString..."
for parent in "${ParentGenerators[@]}"
do
  echo "parent is  $parent "
  parentsString=$parentsString$space$parent$jhash
  echo "parents string equals " $parentsString
done
##################################################



########################## set RUFUS directory path variables ##############################
RUFUSmodel=$RDIR/bin/ModelDist
RUFUSfilter=$RDIR/bin/RUFUS.Filter
RufAlu=$RDIR/bin/RufAlu/src/aluDetect
RUFUSOverlap=$RDIR/scripts/Overlap.sh
RunJelly=$RDIR/cloud/RunJellyForRUFUS
PullSampleHashes=$RDIR/cloud/CheckJellyHashList.sh
samtools=$RDIR/bin/samtools/samtools
############################################################################################

pa
####################__GENERATE_JHASH_FILES_FROM_JELLYFISH__#####################
for parent in "${ParentGenerators[@]}"
do
     /usr/bin/time -v bash $RunJelly $parent $K $(echo $Threads -2 | bc) 2 
done

/usr/bin/time -v bash $RunJelly $ProbandGenerator $K $(echo $Threads -2 | bc) 2  

wait

for parent in "${ParentGenerators[@]}"
do
        ######Check that we produced Non-empty Jhash tables for parents                                                                                                                                                                       
     if [ ! -s "$parent".Jhash ]
     then
        echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
        echo "$parent.Jhash  is empty"
        echo "Killing run with exit status 1"
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        kill -9 $$
     fi
done

  ######Check that we produced Non-empty Jhash tables for Proband
if [ ! -s "$ProbandGenerator".Jhash ]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "$ProbandGenerator.Jhash  is empty"
    echo "Killing run with exit status 1"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$
fi
##############################################################################


##################__GENERATE_JHASH_HISTOGRAMS__#################################
perl -ni -e 's/ /\t/;print' "$ProbandGenerator".Jhash.histo
for parent in "${ParentGenerators[@]}"
do
  perl -ni -e 's/ /\t/;print' "$parent".Jhash.histo
done
##############################################################################


#######################__RUFUS_Model__############################################
if [  -z "$_arg_min" ]
then
    echo "min not provided, building model" 
    if [ -e "$ProbandGenerator.Jhash.histo.7.7.model" ]
    then
        echo "skipping model"
	MutantMinCov=$(head -2 "$ProbandGenerator".Jhash.histo.7.7.model | tail -1 )
        echo "mutant min coverage from generated model is $MutantMinCov"

    else
	echo "staring model"
        /usr/bin/time -v "$RUFUSmodel" "$ProbandGenerator".Jhash.histo $K 150 $Threads
        echo "done with model"
	MutantMinCov=$(head -2 "$ProbandGenerator".Jhash.histo.7.7.model | tail -1 )
	echo "mutant min coverage from generated model is $MutantMinCov"
    fi
else 
    echo "min was provided, min is $_arg_min" 
    MutantMinCov="$_arg_min" 
    touch "$ProbandGenerator".Jhash.histo.7.7.model
fi
#######################################################################################


###########################__RUFUS_BUILD__#################################################
#echo "starting RUFUS build"
#if [ -e out."$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList ]
#then
#        echo "Skipping build"
#else
#    /usr/bin/time -v $RDIR/cloud/jellyfish-MODIFIED-merge/bin/jellyfish merge "$ProbandGenerator".Jhash $(echo $parentsString)  >  out."$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList
#fi
#echo "done with RUFUS build "

##if [ ! -s out."$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList ]
##then
##   echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
##    echo "out."$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList  is empty"
##    echo "Killing run with exit status 1"
##    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
##    kill -9 $$
## fi

#########################################################################################





#################################__HASH_LIST_FILTER__#####################################
if [ -s "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList ]
then 
    echo "skipping $ProbandGenerator.HashList pull "
else
    rm  "$ProbandGenerator".temp
    mkfifo "$ProbandGenerator".temp
     /usr/bin/time -v $RDIR/cloud/jellyfish-MODIFIED-merge/bin/jellyfish merge "$ProbandGenerator".Jhash $(echo $parentsString)  > "$ProbandGenerator".temp & 
    /usr/bin/time -v bash $PullSampleHashes $ProbandGenerator.Jhash "$ProbandGenerator".temp $MutantMinCov > "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList
    #/usr/bin/time -v bash $PullSampleHashes "$ProbandGenerator".Jhash out."$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList $MutantMinCov > "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList
    wait
fi



######################__RUFUS_FILTER__##################################################
echo "starting RUFUS filter"
if [ -e "$ProbandGenerator".Mutations.fastq ]
then
    echo "skipping filter"
else
    rm  "$ProbandGenerator".temp
    mkfifo "$ProbandGenerator".temp
    /usr/bin/time -v  bash "$ProbandGenerator" | "$RDIR"/cloud/PassThroughSamCheck.stranded "$ProbandGenerator".filter.chr >  "$ProbandGenerator".temp &
    /usr/bin/time -v   "$RUFUSfilter"  "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList "$ProbandGenerator".temp "$ProbandGenerator" "$K" 5 5 10 "$(echo $Threads -2 | bc)" &
    #bash $ProbandGenerator | $RDIR/cloud/PassThroughSamCheck.stranded $ProbandGenerator.filter.chr | head 
    #/usr/bin/time -v "$RUFUSfilter" "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList <(bash $ProbandGenerator | $RDIR/cloud/PassThroughSamCheck.stranded $ProbandGenerator.filter.chr)  "$ProbandGenerator" $K 5 5 10 $(echo $Threads -2 | bc)
    wait
fi
########################################################################################


###################__RUFUS_OVERLAP__#############################################
if [ -e "$ProbandGenerator".V2.overlap.hashcount.fastq.bam.vcf ]
then
    echo "skipping overlap"
else
    echo "starting RUFUS overlap"
    
    /usr/bin/time -v bash $RUFUSOverlap "$_arg_ref" "$ProbandGenerator".Mutations.fastq 5 "$ProbandGenerator" "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList "$K" "$Threads" "$ProbandGenerator".Jhash "$parentsString" "$_arg_ref_bwa" "$_arg_refhash"
fi
##############################################################################################




#TODO: fix hard coding aluLIst path
######__RUFALU__#############
aluList=/uufs/chpc.utah.edu/common/home/u0401321/RufAlu/aluList/primate_non-LTR_Retrotransposon.fasta

echo "running RufAlu, command is" 

echo "$RufAlu $ProbandFileName $ProbandGenerator.V2.overlap.hashcount.fastq  $aluList $_arg_ref  $(echo $ParentFileNames) "

$RufAlu $_arg_subject $_arg_subject.generator.V2.overlap.hashcount.fastq  $aluList $_arg_ref  $(echo $ParentFileNames)
#########################

echo "seeing what working dir is to pass to RufAlu" $PWD

echo "done with everything"
exit 0
# ] <-- needed because of Argbash
