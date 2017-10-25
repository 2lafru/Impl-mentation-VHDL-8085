add wave -position insertpoint  \
sim:/decodeuradresse/adresse \
sim:/decodeuradresse/CSrom \
sim:/decodeuradresse/CSram1 \
sim:/decodeuradresse/CSram2 \
sim:/decodeuradresse/CSram3 \
sim:/decodeuradresse/adresserom \
sim:/decodeuradresse/adresseram1 \
sim:/decodeuradresse/adresseram2 \
sim:/decodeuradresse/adresseram3

run
force -freeze sim:/decodeuradresse/adresse 010000111 0
run
run
force -freeze sim:/decodeuradresse/adresse 101111111 0
run
run
force -freeze sim:/decodeuradresse/adresse 111010101 0
run
run
force -freeze sim:/decodeuradresse/adresse 000000000 0
run
run
force -freeze sim:/decodeuradresse/adresse 011111000 0
run
run