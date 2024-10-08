#!/bin/bash

(
    
    for i in {1..3}; do
        echo "n"     
        echo "p"     
        echo ""      
        echo ""      
        echo "+1G"   
    done

    
    echo "n"         
    echo "e"         
    echo ""          
    echo ""          
    echo ""          

    
    for i in {1..6}; do
        echo "n"     
        echo ""      
        echo ""      
        echo "+1G"   
    done

        echo "n"     
        echo ""      
        echo ""      
        echo "" 
	

    echo "w"         
) | sudo fdisk /dev/sdc

    for i in {1..3} {5..11}; do
        sudo mkfs -t ext4 /dev/sdc$i
    done

    for i in {1..3}; do
        for j in {1..3}; do
            sudo mount /dev/sdc$(( (i - 1) * 3 + j )) /Examenes-UTN/alumno_$i/parcial_$j
        done
    done

sudo mount /dev/sdc11 /Examenes-UTN/profesores

particiones=(
    "/dev/sdc1 /Examenes-UTN/alumno_1/parcial_1"
    "/dev/sdc2 /Examenes-UTN/alumno_1/parcial_2"
    "/dev/sdc3 /Examenes-UTN/alumno_1/parcial_3"
    "/dev/sdc5 /Examenes-UTN/alumno_2/parcial_1"
    "/dev/sdc6 /Examenes-UTN/alumno_2/parcial_2"
    "/dev/sdc7 /Examenes-UTN/alumno_2/parcial_3"
    "/dev/sdc8 /Examenes-UTN/alumno_3/parcial_1"
    "/dev/sdc9 /Examenes-UTN/alumno_3/parcial_2"
    "/dev/sdc10 /Examenes-UTN/alumno_3/parcial_3"
    "/dev/sdc11 /Examenes-UTN/profesores"
)


for entrada in "${particiones[@]}"; do
    echo "$entrada ext4 defaults 0 0" | sudo tee -a /etc/fstab
done

sudo mount -a

