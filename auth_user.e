namespace auth_user

include std\text.e
include includes\input.e
include includes\viewerlog.e
include std\types.e


public function get_auth_user()
    sequence cmdWithUser = ""
    sequence UserInput = upper(input("Deseja inserir dados de usu rio?[S/N] ", input:TYPE_TEXT, 1))

    if (equal(UserInput, "S")) then
        puts(1, "\n\n### Lista de usu rios ###\n")
        
        integer codeErr = system_exec("adb shell pm list users")
        
        if (codeErr > 0) then
            
            TextError("Falha na lista de usu rios.")
            
            input("...", input:TYPE_TEXT, 0)
            abort(1)
        end if
        
        loop do
            puts(1, "\n")
            UserInput = input("Informe o id de usu rio: ", input:TYPE_TEXT, 3)
            
            until (t_digit(UserInput))
        end loop
        
        cmdWithUser = "-k --user " & UserInput
    else
        UserInput = ""
    end if
    
    return cmdWithUser
end function
