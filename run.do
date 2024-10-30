set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage save sfifo.ucdb
vcover report sfifo.ucdb -cvg -details
quit
