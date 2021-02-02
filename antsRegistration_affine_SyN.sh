#!/bin/bash
# ARG_HELP([The general script's help msg])
# ARG_POSITIONAL_SINGLE([movingfile],[The moving image])
# ARG_POSITIONAL_SINGLE([fixedfile],[The fixed image])
# ARG_POSITIONAL_SINGLE([outputbasename],[The basename for the output transforms])
# ARG_OPTIONAL_SINGLE([moving-mask],[],[Mask for moving image],[NOMASK])
# ARG_OPTIONAL_SINGLE([fixed-mask],[],[Mask for fixed image],[NOMASK])
# ARG_OPTIONAL_SINGLE([resampled-output],[o],[Output resampled file])
# ARG_OPTIONAL_SINGLE([initial-transform],[],[Initial affine transform],[NONE])
# ARG_OPTIONAL_SINGLE([linear-type],[],[Type of affine transform],[affine])
# ARG_TYPE_GROUP_SET([lineargroup],[LINEAR],[linear-type],[rigid,lsq6,similarity,lsq9,affine,lsq12,exhaustive-affine])
# ARG_OPTIONAL_SINGLE([convergence],[],[Convergence stopping value for registration],[1e-6])
# ARG_OPTIONAL_BOOLEAN([mask-extract],[],[Use masks to extract input images, only works with both images masked],[])
# ARG_OPTIONAL_BOOLEAN([histogram-matching],[],[Enable histogram matching],[on])
# ARG_OPTIONAL_BOOLEAN([skip-affine],[],[Skip the affine stage])
# ARG_OPTIONAL_BOOLEAN([skip-nonlinear],[],[Skip the nonlinear stage])
# ARG_OPTIONAL_BOOLEAN([fast],[f],[Run fast SyN registration])
# ARG_OPTIONAL_BOOLEAN([clobber],[c],[Overwrite files that already exist])
# ARG_OPTIONAL_BOOLEAN([verbose],[v],[Run commands verbosely],[on])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}

# validators

lineargroup()
{
	local _allowed=("rigid" "lsq6" "similarity" "lsq9" "affine" "lsq12" "exhaustive-affine") _seeking="$1"
	for element in "${_allowed[@]}"
	do
		test "$element" = "$_seeking" && echo "$element" && return 0
	done
	die "Value '$_seeking' (of argument '$2') doesn't match the list of allowed values: 'rigid', 'lsq6', 'similarity', 'lsq9', 'affine', 'lsq12' and 'exhaustive-affine'" 4
}


begins_with_short_option()
{
	local first_option all_short_options='hofcv'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_moving_mask="NOMASK"
_arg_fixed_mask="NOMASK"
_arg_resampled_output=
_arg_initial_transform="NONE"
_arg_linear_type="affine"
_arg_convergence="1e-6"
_arg_mask_extract="off"
_arg_histogram_matching="on"
_arg_skip_affine="off"
_arg_skip_nonlinear="off"
_arg_fast="off"
_arg_clobber="off"
_arg_verbose="on"


print_help()
{
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [-h|--help] [--moving-mask <arg>] [--fixed-mask <arg>] [-o|--resampled-output <arg>] [--initial-transform <arg>] [--linear-type <LINEAR>] [--convergence <arg>] [--(no-)mask-extract] [--(no-)histogram-matching] [--(no-)skip-affine] [--(no-)skip-nonlinear] [-f|--(no-)fast] [-c|--(no-)clobber] [-v|--(no-)verbose] <movingfile> <fixedfile> <outputbasename>\n' "$0"
	printf '\t%s\n' "<movingfile>: The moving image"
	printf '\t%s\n' "<fixedfile>: The fixed image"
	printf '\t%s\n' "<outputbasename>: The basename for the output transforms"
	printf '\t%s\n' "-h, --help: Prints help"
	printf '\t%s\n' "--moving-mask: Mask for moving image (default: 'NOMASK')"
	printf '\t%s\n' "--fixed-mask: Mask for fixed image (default: 'NOMASK')"
	printf '\t%s\n' "-o, --resampled-output: Output resampled file (no default)"
	printf '\t%s\n' "--initial-transform: Initial affine transform (default: 'NONE')"
	printf '\t%s\n' "--linear-type: Type of affine transform. Can be one of: 'rigid', 'lsq6', 'similarity', 'lsq9', 'affine', 'lsq12' and 'exhaustive-affine' (default: 'affine')"
	printf '\t%s\n' "--convergence: Convergence stopping value for registration (default: '1e-6')"
	printf '\t%s\n' "--mask-extract, --no-mask-extract: Use masks to extract input images, only works with both images masked (off by default)"
	printf '\t%s\n' "--histogram-matching, --no-histogram-matching: Enable histogram matching (on by default)"
	printf '\t%s\n' "--skip-affine, --no-skip-affine: Skip the affine stage (off by default)"
	printf '\t%s\n' "--skip-nonlinear, --no-skip-nonlinear: Skip the nonlinear stage (off by default)"
	printf '\t%s\n' "-f, --fast, --no-fast: Run fast SyN registration (off by default)"
	printf '\t%s\n' "-c, --clobber, --no-clobber: Overwrite files that already exist (off by default)"
	printf '\t%s\n' "-v, --verbose, --no-verbose: Run commands verbosely (on by default)"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			--moving-mask)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_moving_mask="$2"
				shift
				;;
			--moving-mask=*)
				_arg_moving_mask="${_key##--moving-mask=}"
				;;
			--fixed-mask)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_fixed_mask="$2"
				shift
				;;
			--fixed-mask=*)
				_arg_fixed_mask="${_key##--fixed-mask=}"
				;;
			-o|--resampled-output)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_resampled_output="$2"
				shift
				;;
			--resampled-output=*)
				_arg_resampled_output="${_key##--resampled-output=}"
				;;
			-o*)
				_arg_resampled_output="${_key##-o}"
				;;
			--initial-transform)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_initial_transform="$2"
				shift
				;;
			--initial-transform=*)
				_arg_initial_transform="${_key##--initial-transform=}"
				;;
			--linear-type)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_linear_type="$(lineargroup "$2" "linear-type")" || exit 1
				shift
				;;
			--linear-type=*)
				_arg_linear_type="$(lineargroup "${_key##--linear-type=}" "linear-type")" || exit 1
				;;
			--convergence)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_convergence="$2"
				shift
				;;
			--convergence=*)
				_arg_convergence="${_key##--convergence=}"
				;;
			--no-mask-extract|--mask-extract)
				_arg_mask_extract="on"
				test "${1:0:5}" = "--no-" && _arg_mask_extract="off"
				;;
			--no-histogram-matching|--histogram-matching)
				_arg_histogram_matching="on"
				test "${1:0:5}" = "--no-" && _arg_histogram_matching="off"
				;;
			--no-skip-affine|--skip-affine)
				_arg_skip_affine="on"
				test "${1:0:5}" = "--no-" && _arg_skip_affine="off"
				;;
			--no-skip-nonlinear|--skip-nonlinear)
				_arg_skip_nonlinear="on"
				test "${1:0:5}" = "--no-" && _arg_skip_nonlinear="off"
				;;
			-f|--no-fast|--fast)
				_arg_fast="on"
				test "${1:0:5}" = "--no-" && _arg_fast="off"
				;;
			-f*)
				_arg_fast="on"
				_next="${_key##-f}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-f" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-c|--no-clobber|--clobber)
				_arg_clobber="on"
				test "${1:0:5}" = "--no-" && _arg_clobber="off"
				;;
			-c*)
				_arg_clobber="on"
				_next="${_key##-c}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-c" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-v|--no-verbose|--verbose)
				_arg_verbose="on"
				test "${1:0:5}" = "--no-" && _arg_verbose="off"
				;;
			-v*)
				_arg_verbose="on"
				_next="${_key##-v}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-v" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'movingfile', 'fixedfile' and 'outputbasename'"
	test "${_positionals_count}" -ge 3 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 3 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 3 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 3 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_movingfile _arg_fixedfile _arg_outputbasename "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash
# Validation of values


### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

set -euo pipefail
tmpdir=$(mktemp -d)

if [[ ( -s ${_arg_outputbasename}0_GenericAffine.xfm || -s ${_arg_outputbasename}0GenericAffine.mat ) && ! ${_arg_clobber} == "on" ]]; then
  echo "File ${_arg_outputbasename}0_GenericAffine.xfm or ${_arg_outputbasename}0GenericAffine.mat already exists!"
  exit 1
fi

if [[ ( -s ${_arg_outputbasename}1_NL.xfm || -s ${_arg_outputbasename}1Warp.nii.gz ) && ! ${_arg_clobber} == "on" ]]; then
  echo "File ${_arg_outputbasename}1_NL.xfm or ${_arg_outputbasename}1Warp.nii.gz already exists!"
  exit 1
fi


if [[ -s ${_arg_resampled_output} && ! ${_arg_clobber} == "on" ]]; then
  echo "File ${_arg_resampled_output} already exists!"
  exit 1
fi

#Check for minc or nifti
if [[ "${_arg_movingfile}" =~ .*"mnc" || "${_arg_fixedfile}" =~ .*"mnc" ]]; then
  minc_mode="--minc"
  second_stage_initial="${_arg_outputbasename}0_GenericAffine.xfm"
  second_stage_final="${_arg_outputbasename}1_NL.xfm"
  intermediate_resample="${tmpdir}/resample.mnc"
else
  minc_mode=""
  second_stage_initial="${_arg_outputbasename}0GenericAffine.mat"
  second_stage_final="${_arg_outputbasename}1Warp.nii.gz"
  intermediate_resample="${tmpdir}/resample.nii.gz"
fi

#Enable verbosity
if [[ ${_arg_verbose} == "on" ]]; then
  verbose="--verbose"
else
  verbose=""
fi

#Enable histogram matching
if [[ ${_arg_histogram_matching} == "on" ]]; then
  _arg_histogram_matching=1
else
  _arg_histogram_matching=0
fi

if [[ ${_arg_mask_extract} == "on" && ${_arg_fixed_mask} != "NOMASK" && ${_arg_moving_mask} != "NOMASK" ]]; then
  ImageMath 3 ${tmpdir}/fixed_extracted.nii.gz m ${_arg_fixedfile} ${_arg_fixed_mask}
  ImageMath 3 ${tmpdir}/moving_extracted.nii.gz m ${_arg_movingfile} ${_arg_moving_mask}
  movingfile=${tmpdir}/moving_extracted.nii.gz
  fixedfile=${tmpdir}/fixed_extracted.nii.gz
  movingmask=NOMASK
  fixedmask=NOMASK
else
  movingfile=${_arg_movingfile}
  fixedfile=${_arg_fixedfile}
  movingmask=${_arg_moving_mask}
  fixedmask=${_arg_fixed_mask}
fi


fixed_minimum_resolution=$(python -c "print(min([abs(x) for x in [float(x) for x in \"$(PrintHeader ${fixedfile} 1)\".split(\"x\")]]))")

#Calculate Maximum FOV using the size of the fixed image
#fixed_maximum_resolution=$(python -c "print(max([ a*b for a,b in zip([abs(x) for x in [float(x) for x in \"$(PrintHeader ${fixedfile} 1)\".split(\"x\")]],[abs(x) for x in [float(x) for x in \"$(PrintHeader ${fixedfile} 2)\".split(\"x\")]])]))")

#Calculate Maximum FOV using the foreground/background of the fixed image
ThresholdImage 3 ${fixedfile} ${tmpdir}/bgmask.mnc 1e-12 Inf 1 0
ThresholdImage 3 ${fixedfile} ${tmpdir}/otsu.mnc Otsu 4 ${tmpdir}/bgmask.mnc
ThresholdImage 3 ${tmpdir}/otsu.mnc ${tmpdir}/otsu.mnc 2 Inf 1 0
LabelGeometryMeasures 3 ${tmpdir}/otsu.mnc none ${tmpdir}/geometry.csv
fixed_maximum_resolution=$(python -c "print(max([ a*b for a,b in zip( [ a-b for a,b in zip( [float(x) for x in \"$(tail -1 ${tmpdir}/geometry.csv | cut -d, -f 14,16,18)\".split(\",\") ],[float(x) for x in \"$(tail -1 ${tmpdir}/geometry.csv | cut -d, -f 13,15,17)\".split(\",\") ])],[abs(x) for x in [float(x) for x in \"$(PrintHeader ${fixedfile} 1)\".split(\"x\")]])]))")

steps_affine=$(ants_generate_iterations.py --min ${fixed_minimum_resolution} --max ${fixed_maximum_resolution} --convergence ${_arg_convergence} --output ${_arg_linear_type})
steps_syn=$(ants_generate_iterations.py --min ${fixed_minimum_resolution} --max ${fixed_maximum_resolution} --convergence ${_arg_convergence})

if [[ "${_arg_initial_transform}" != "NONE" ]]; then
  initial_transform=${_arg_initial_transform}
else
  initial_transform="[ ${fixedfile},${movingfile},1 ]"
fi

if [[ ${_arg_skip_affine} == "off" ]]; then
    antsRegistration --dimensionality 3 ${verbose} ${minc_mode} \
      --output [ ${_arg_outputbasename} ] \
      --use-histogram-matching ${_arg_histogram_matching} \
      --initial-moving-transform ${initial_transform} \
      $(eval echo ${steps_affine})
else
  if [[ "${_arg_initial_transform}" != "NONE" ]]; then
    cp -f "${_arg_initial_transform}" "${second_stage_initial}" || true
  else
    if [[ -n ${minc_mode} ]]; then
      #Generate identity transform
      param2xfm "${second_stage_initial}"
    else
      ImageMath 3 "${second_stage_initial}" MakeAffineTransform 1
    fi
  fi
fi

if [[ ${_arg_fast} == "on" ]]; then
  syn_metric="--metric Mattes[ ${fixedfile},${movingfile},1,32,None ]"
else
  syn_metric="--metric CC[ ${fixedfile},${movingfile},1,4,None ]"
fi

if [[ ${_arg_skip_nonlinear} == "off" ]]; then
  antsRegistration --dimensionality 3 ${verbose} ${minc_mode} \
    --output [ ${_arg_outputbasename} ] \
    --use-histogram-matching ${_arg_histogram_matching} \
    --initial-moving-transform "${second_stage_initial}" \
    --transform SyN[ 0.1,3,0 ] \
    ${syn_metric} \
    $(eval echo ${steps_syn}) \
    --masks [ ${fixedmask},${movingmask} ]
fi

if [[ ${_arg_resampled_output} ]]; then
  if [[ ${_arg_skip_nonlinear} == "off" ]]; then
    antsApplyTransforms -d 3 -i ${_arg_movingfile} -r ${_arg_fixedfile} -t "${second_stage_final}" -t "${second_stage_initial}" -o "${intermediate_resample}" -n BSpline[5] ${verbose}
  else
    antsApplyTransforms -d 3 -i ${_arg_movingfile} -r ${_arg_fixedfile} -t "${second_stage_initial}" -o "${intermediate_resample}" -n BSpline[5] ${verbose}
  fi
  ThresholdImage 3 "${intermediate_resample}" "${tmpdir}/clampmask.mnc" 1e-12 Inf 1 0
  ImageMath 3 "${_arg_resampled_output}" m "${intermediate_resample}" "${tmpdir}/clampmask.mnc"
fi


rm -rf "${tmpdir}"

# ] <-- needed because of Argbash
