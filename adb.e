namespace adb

include includes\WinNet.ew
include includes\gconstants.e
include includes\viewerlog.e
include includes\utils_text_function.e
------------------------------
include std\os.e
include std\filesys.e
include std\text.e
include std\utils.e
include std\filesys.e
include std\math.e


public procedure uninstall(sequence cmdWithUser, sequence dirs)
	integer
		startIndex = 0,
		endIndex = 0
	sequence namePkg = ""
	
	
	for x = 3 to length(dirs) do
		sequence currentDir = dirs[x][1]
		
		namePkg = filename(currentDir)
		
		startIndex = indexOf("]", namePkg)
		startIndex = iif(startIndex < 1, 1, startIndex+1)
		namePkg = namePkg[startIndex..$]
		
		endIndex = indexOf("-v", namePkg)
		endIndex = iif(endIndex < 1, length(namePkg), endIndex-1)
		namePkg = namePkg[1..endIndex]
		
		puts(1, format("Deinstalando o app []", {namePkg}))
		
		integer codeErr = system_exec(
			format("cmd /c adb\\adb shell pm uninstall [] [] >>process.log", {cmdWithUser, namePkg}),
			2
		)
		
		if (codeErr) then
			TextError(" -> Falha <-\n")
		else
			TextSuccess(" -> Ok! <-\n")
		end if
		
	end for
end procedure


public procedure install(sequence dirs)
    for x = 3 to length(dirs) do
		sequence currentDir = dirs[x][1]
		sequence path = PathApps&"\\" & currentDir
		
		puts(1, format("Instalando o app []", {currentDir}))
		
		if (system_exec(format("cmd /c adb\\adb install \"[]\" >>process.log", {path}))) then
			TextError(" -> Erro na instala‡Æo <-\n")
		else
			TextSuccess(" -> Instalado <-\n")
		end if
	end for
end procedure


public procedure download()
    atom t = 0
    atom sizeFile = 0
    create_directory("adb")
    
    for i=1 to length(urls) do
        sequence url = urls[i]
        sequence nameFile = url[1]
        sequence link = url[2]
        sequence path = PathAdb & "\\" & nameFile
        t = time()

        if file_exists(path) then
            continue
        end if
        
        puts(1, format("\nIniciando o donwload do arquivo \"[]\"\n", {nameFile}))
        downloadFile(link, path)
        sizeFile = file_length(path)

        integer n = math:trunc(sizeFile/1024)

        TextSuccess("Download conclu¡do!\n")
        puts(1, format("Tempo decorrido : []ms\n", {time()-t}))
        puts(1, format("Size = [.2]mb\n", {sizeFile/(1024*(1*1024))}))
    end for
end procedure

procedure downloadFile(sequence url, sequence path)

    sequence req = HttpGetRequest(url)
    
    atom fn = open(path, "wb")
	puts(fn, req)
    close(fn)
    
end procedure
