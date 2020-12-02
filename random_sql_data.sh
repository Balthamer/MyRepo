#!/bin/bash
declare -a fname_array
fname_array=(James  Mary  John  Patricia  Robert  Jennifer  Michael  Linda  William  Elizabeth  David  Barbara  Richard  Susan  Joseph  Jessica  Thomas  Sarah  Charles  Karen  Christopher  Nancy  Daniel  Lisa  Matthew  Margaret  Anthony  Betty  Donald  Sandra  Mark  Ashley  Paul  Dorothy  Steven  Kimberly  Andrew  Emily  Kenneth  Donna  Joshua  Michelle  Kevin  Carol  Brian  Amanda  George  Melissa  Edward  Deborah  Ronald  Stephanie  Timothy  Rebecca  Jason  Laura  Jeffrey  Sharon  Ryan  Cynthia  Jacob  Kathleen  Gary  Amy  Nicholas  Shirley  Eric  Angela  Jonathan  Helen  Stephen  Anna  Larry  Brenda  Justin  Pamela  Scott  Nicole  Brandon  Samantha  Benjamin  Katherine  Samuel  Emma  Frank  Ruth  Gregory  Christine  Raymond  Catherine  Alexander  Debra  Patrick  Rachel  Jack  Carolyn  Dennis  Janet  Jerry  Virginia  Tyler  Maria  Aaron  Heather  Jose  Diane  Henry  Julie  Adam  Joyce  Douglas  Victoria  Nathan  Kelly  Peter  Christina  Zachary  Lauren  Kyle  Joan  Walter  Evelyn  Harold  Olivia  Jeremy  Judith  Ethan  Megan  Carl  Cheryl  Keith  Martha  Roger  Andrea  Gerald  Frances  Christian  Hannah  Terry  Jacqueline  Sean  Ann  Arthur  Gloria  Austin  Jean  Noah  Kathryn  Lawrence  Alice  Jesse  Teresa  Joe  Sara  Bryan  Janice  Billy  Doris  Jordan  Madison  Albert  Julia  Dylan  Grace  Bruce  Judy  Willie  Abigail  Gabriel  Marie  Alan  Denise  Juan  Beverly  Logan  Amber  Wayne  Theresa  Ralph  Marilyn  Roy  Danielle  Eugene  Diana  Randy  Brittany  Vincent  Natalie  Russell  Sophia  Louis  Rose  Philip  Isabella  Bobby  Alexis  Johnny  Kayla  Bradley  Charlotte)
declare -a lname_array
lname_array=(Smith  Johnson  Williams  Brown  Jones  Garcia  Miller  Davis  Rodriguez  Martinez  Hernandez  Lopez  Gonzales  Wilson  Anderson  Thomas  Taylor  Moore  Jackson  Martin  Lee  Perez  Thompson  White  Harris  Sanchez  Clark  Ramirez  Lewis  Robinson  Walker  Young  Allen  King  Wright  Scott  Torres  Nguyen  Hill  Flores  Green  Adams  Nelson  Baker  Hall  Rivera  Campbell  Mitchell  Carter  Roberts  Gomez  Phillips  Evans  Turner  Diaz  Parker  Cruz  Edwards  Collins  Reyes  Stewart  Morris  Morales  Murphy  Cook  Rogers  Gutierrez  Ortiz  Morgan  Cooper  Peterson  Bailey  Reed  Kelly  Howard  Ramos  Kim  Cox  Ward  Richardson  Watson  Brooks  Chavez  Wood  James  Bennet  Gray  Mendoza  Ruiz  Hughes  Price  Alvarez  Castillo  Sanders  Patel  Myers  Long  Ross  Foster  Jimenez)
declare -a location_array
location_array=(Corporate South East West)
for i in {006..100}; do 
    temp=`echo $RANDOM`
    year=$(echo $temp % 50 | bc)
    month=$(echo $temp % 12 | bc)
    day=$(echo $temp % 31 | bc)
    dob=$(date -I -d "1950-01-01 + $year years + $month months + $day days")
    f_n_pos=$(echo $temp % 200 | bc)
    fname=$(echo ${fname_array[f_n_pos]})
    l_n_pos=$(echo $temp % 100 | bc)
    lname=$(echo ${lname_array[l_n_pos]})
    today=`date -I`
    hire_offset=$(echo $temp % 1825 | bc)
    hire_date=$(date -I -d "$today - $hire_offset days")
    loc_pos=$(echo $temp % 4 | bc)
    location=$(echo ${location_array[loc_pos]})
    super_visor=$((loc_pos + 1))
    echo $i $fname $lname $dob $hire_date $location 00$super_visor
done
