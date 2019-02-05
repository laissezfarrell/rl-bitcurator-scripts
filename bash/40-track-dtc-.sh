for D in *; do
	cd /home/bcadmin/Desktop/kryoflux_2.6_linux/dtc
	./dtc -m1 -f/home/bcadmin/Desktop/40-track-test/$D/* -i -f/home/bcadmin/Desktop/40-track-test/40-track-output/$D-40track.img -k2 -i4 -l8 > /home/bcadmin/Desktop/40-track-test/40-track-output/$D-40track.log 2>&1
done
