export suffix=pep.cdhit_0.99.s.po.pep

for x in R15_Enn3 \
R17_Eandrei \
R43_Enana \
R98_Enp6 \
R82_Enn9 \
R07_Enn9 \
R08_Enn7 \
R35_Enp2 \
R54_Enn6 \
R28_Enn2 \
R09_Enp1 \
R81_Enn1 \
R79_Etracta \
R85_Espelaea \
R74_Emagnifica \
R80_Ebalatonica \
R24_Enn3

do
blastp -db /home/sasha_v/db_mitochondrion/mitochondrion_Eisenia -max_target_seqs 1 -word_size 3 -num_threads 10 -evalue 1e-5 -outfmt "6 qseqid pident evalue bitscore stitle" -query /home/sergey/${x}.${suffix} -out /home/sasha_e/worms/${x}_blast
awk '{print $1}' /home/sasha_e/worms/${x}_blast > ${x}_ids.list
SeqFilter /home/sergey/${x}.${suffix} --ids ${x}_ids.list --ids-exclude -o ${x}_no_mtDNA.${suffix}
done
