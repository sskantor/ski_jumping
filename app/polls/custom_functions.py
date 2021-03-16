    
def checkInput (query_params):

    banned_chars = '\'";()=~`!@#$%^&*+[]\{\}|'

    for param in query_params:        

        if any(char in banned_chars for char in param):
            msg = 1
            break
        
        msg = 0
    
    return msg
