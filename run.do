set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage save dma.ucdb
vcover report dma.ucdb -cvg -details
quit
