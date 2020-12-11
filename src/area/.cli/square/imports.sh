cli::import integrate .group
math::square () 
{ 
    math::multiply $1 $1
}
cli::import cli_math
cli::import cli_constant
math::multiply () 
{ 
    IFS='*' expr=$*;
    echo "$expr" | bc -l
}
declare -g -- CONSTANT_PI="3.14159"
