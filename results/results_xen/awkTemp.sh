NAME="$1"
xz -dk $NAME*.xz
in2csv -k _RenderTable "$NAME".json > "$NAME".csv
awk -F "\"*," '{for (i=15; i<=NF; i+=2) { r = (r ? r OFS : "") $i }; print $1 " " $2 " "  r; r="" }' "$NAME".csv  > "$NAME"_average.csv
awk '{a=(($3+$4+$5)/3); $3=a; b=(($6+$7+$8)/3); $4=b; c=(($9+$10+$11)/3); $5=c ; d=(($12+$13+$14)/3); $6=d; e=(($15+$16+$17)/3); $7=e ; print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 }' "$NAME"_average.csv > "$NAME"_average.txt
rm "$NAME".csv
rm "$NAME"_average.csv
awk '{print $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7}' "$NAME"_average.txt > averaged_results.csv
