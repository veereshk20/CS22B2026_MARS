#!/bin/bash

read -p "Enter the number of rows:" rows
read -p "Enter the number columns:" colms

declare -A workspace

build_workspace() {
   for ((i=0; i<rows; i++)); do
       for ((j=0; j<colms; j++)); do
         workspace[$i,$j]=1 
       done    # 1 represents the free space
   done
   show_workspace
}

put_obstacle() {
   local row=$1
   local col=$2
   
   workspace["$row,$col"]=0 
   # o represents the obstacle
}

move_robot() {
   local curr_row=$1
   local curr_col=$2
   read -p "Enter the new row of the robot:" new_row
   read -p "Enter the new column of the robot:" new_col
   #update the new position ofthe robot
   workspace[$curr_row,$curr_col]=1
   
   if [ "${workspace["$new_row,$new_col"]}" -ne 0 ]; then
       workspace["$new_row,$new_col"]='X'
       a=$new_row
       b=$new_col
   fi
      show_workspace
}

show_workspace() {
  for((i=0;i<rows;i++)); do
     for((j=0;j<colms;j++)); do
        echo -n "${workspace[$i,$j]}"
     done
     echo
  done
  echo
}


echo "Before putting an obstacle"
build_workspace

echo "After inserting the obstacle at desired position"
put_obstacle 0 3

put_obstacle 3 4
show_workspace

echo "robot moving through the workspace overcoming obstacles"
move_robot 0 0

  
               
     
       
   
      
               

