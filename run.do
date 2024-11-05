set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage save tdpram.ucdb
vcover report tdpram.ucdb -cvg -details
quit
