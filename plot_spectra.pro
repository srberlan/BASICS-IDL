pro plot_spectra

files = file_search('*_*.asc')   ; espectros combinados

if n_elements(files) eq 0 then begin
   print,'No spectra found'
   return
endif

; archivo postscript
set_plot,'PS'
device, filename='combined_spectra.ps', /landscape, /color

for i=0,n_elements(files)-1 do begin

   readcol, files[i], wave, flux

   plot, wave, flux, $
        xtitle='Wavelength', $
        ytitle='Flux', $
        title=file_basename(files[i]), $
        thick=2

endfor

device,/close
set_plot,'X'

print,'PostScript file created: combined_spectra.ps'
print,'Convert to PDF with: ps2pdf combined_spectra.ps'

end
