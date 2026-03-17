;pro fits2asc

;    b= readfits('5350363768497176320_K.fits',header,/silent)
;    srcst,header,'NAXIS',laxis
;    flux= b(*,0)
;    flux=reform(flux)
;    nw= n_elements(flux)
;    srcst,header,'CRVAL1',wave1 
;    srcst,header,'CDELT1',dwave 
;    wave=wave1+dwave*dindgen(nw) 

;    openw,file,'5350363768497176320_K.asc',/get_lun
;	for ik=0L,n_elements(wave)-1 do printf,file,wave[ik],flux[ik]
;    close,file
;    free_lun,file

;end

pro fits2asc

    files = file_search('*.fits')

    for i=0, n_elements(files)-1 do begin

        fitsfile = files[i]

        b = readfits(fitsfile, header, /silent)

        flux = reform(b(*,0))
        nw = n_elements(flux)

        srcst, header, 'CRVAL1', wave1
        srcst, header, 'CDELT1', dwave

        wave = wave1 + dwave*dindgen(nw)

        outfile = file_basename(fitsfile,'.fits') + '.asc'

        openw, lun, outfile, /get_lun
        for ik=0L, nw-1 do printf, lun, wave[ik], flux[ik]
        close, lun
        free_lun, lun

    endfor

end
