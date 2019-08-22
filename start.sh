#!/bin/bash


#usage : ./start.sh "NAME"

variable=${1}
if [ -z "${variable}" ]
then 
	echo "file name not passed as parameter"
	exit 1
fi

nom=$(echo $1)

echo $nom

#cd lib
./lib/biosensor2.r "$nom"


mkdir RESULTS



mv acceleration_x.pdf RESULTS
mv acceleration_y.pdf RESULTS
mv acceleration_z.pdf RESULTS
mv acceleration_all.pdf RESULTS

mv gyroscope_x.pdf RESULTS
mv gyroscope_y.pdf RESULTS
mv gyroscope_z.pdf RESULTS
mv gyroscope_all.pdf RESULTS


mv cardinal_01.pdf RESULTS
mv cardinal_02.pdf RESULTS
mv cardinal_03.pdf RESULTS
mv cardinal_04.pdf RESULTS
mv cardinal_all.pdf RESULTS


mv electrodemm01.pdf RESULTS
mv electrodemm02.pdf RESULTS
mv electrodemm03.pdf RESULTS
mv electrodemm04.pdf RESULTS
mv electrodemm05.pdf RESULTS
mv electrodemm06.pdf RESULTS
mv electrodemm07.pdf RESULTS
mv electrodemm08.pdf RESULTS

mv summary_acceleration.txt RESULTS
mv summary_gyroscope.txt RESULTS
mv summary_electrodes.txt RESULTS
mv summary_orientation.txt RESULTS
 

cd RESULTS

mv summary_acceleration.txt $(echo summary_acceleration.txt | sed "s/\./".$nom"\./")
mv summary_gyroscope.txt $(echo summary_gyroscope.txt | sed "s/\./".$nom"\./")
mv summary_electrodes.txt $(echo summary_electrodes.txt | sed "s/\./".$nom"\./")
mv summary_orientation.txt $(echo summary_orientation.txt | sed "s/\./".$nom"\./")

mv acceleration_x.pdf $(echo acceleration_x.pdf | sed "s/\./".$nom"\./")
mv acceleration_y.pdf $(echo acceleration_y.pdf | sed "s/\./".$nom"\./")
mv acceleration_z.pdf $(echo acceleration_z.pdf | sed "s/\./".$nom"\./")
mv acceleration_all.pdf $(echo acceleration_all.pdf | sed "s/\./".$nom"\./")

mv gyroscope_x.pdf $(echo gyroscope_x.pdf | sed "s/\./".$nom"\./")
mv gyroscope_y.pdf $(echo gyroscope_y.pdf | sed "s/\./".$nom"\./")
mv gyroscope_z.pdf $(echo gyroscope_z.pdf | sed "s/\./".$nom"\./")
mv gyroscope_all.pdf $(echo gyroscope_all.pdf | sed "s/\./".$nom"\./")


mv cardinal_01.pdf $(echo cardinal_01.pdf | sed "s/\./".$nom"\./")
mv cardinal_02.pdf $(echo cardinal_02.pdf | sed "s/\./".$nom"\./")
mv cardinal_03.pdf $(echo cardinal_03.pdf | sed "s/\./".$nom"\./")
mv cardinal_04.pdf $(echo cardinal_04.pdf | sed "s/\./".$nom"\./")
mv cardinal_all.pdf $(echo cardinal_all.pdf | sed "s/\./".$nom"\./")

mv electrodemm01.pdf $(echo electrodemm01.pdf | sed "s/\./".$nom"\./")
mv electrodemm02.pdf $(echo electrodemm02.pdf | sed "s/\./".$nom"\./")
mv electrodemm03.pdf $(echo electrodemm03.pdf | sed "s/\./".$nom"\./")
mv electrodemm04.pdf $(echo electrodemm04.pdf | sed "s/\./".$nom"\./")
mv electrodemm05.pdf $(echo electrodemm05.pdf | sed "s/\./".$nom"\./")
mv electrodemm06.pdf $(echo electrodemm06.pdf | sed "s/\./".$nom"\./")
mv electrodemm07.pdf $(echo electrodemm07.pdf | sed "s/\./".$nom"\./")
mv electrodemm08.pdf $(echo electrodemm08.pdf | sed "s/\./".$nom"\./")

cd ..

zip -r RESULTS.zip RESULTS

rm -rf RESULTS

mv RESULTS.zip $(echo RESULTS.zip | sed "s/\./".$nom"\./")

rm acceleration.txt
rm gyroscope.txt
rm comment.txt
rm orientation.txt
rm emg.txt

exit 0
