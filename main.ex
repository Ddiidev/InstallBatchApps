include includes\gconstants.e
include includes\primitive_types.e
include includes\viewerlog.e
include includes\input.e
include auth_user.e
include adb.e
----------------------------
include std\serialize.e
include std\console.e
include std\convert.e
include std\text.e
include std\task.e
include std\filesys.e
include std\math.e
include std\os.e
include std\utils.e
include std\win32\msgbox.e
include std\types.e


--- Nomes dos '.apk' da pasta 'Apps' devem ter o seguinte formato:
--- [nome opcional]com.myapps.1.34.366.andro.apk
--- Ps: Tem que ter o exato nome do pacote.
procedure main()

    puts(1, "\n=========================================\n")
	puts(1, "Verificando o download do adb.\n\n")
	sleep(1)
    adb:download()

    sequence dirs =
        dir(PathApps)
    
    sequence cmdWithUser =
        auth_user:get_auth_user()
    
    if (file_exists("process.log")) then
        delete_file("process.log")
    end if
    
    
    puts(1, "\n=========================================\n")
	puts(1, "Desinstalando todos os apps contidos na pasta...\n\n")
	sleep(1)
    adb:uninstall(cmdWithUser, dirs)
    
    
    puts(1, "\n=========================================\n")
    puts(1, "Instalando todos os apps contidos na pasta...\n\n")
    sleep(1)
    adb:install(dirs)
    
    
    message_box(
        "Processo concluído\n"&
        "Todos os apps foram instalados!"
        ,
        "Processo de instalação concluído!", MB_OK
    )
end procedure


main()


