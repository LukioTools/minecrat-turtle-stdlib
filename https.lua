 
function GetHTTP( sUrl )
    -- write( "Connecting to " .. sUrl .. "... " )
    local ok, err = http.checkURL( sUrl )
    if not ok then
        print( "Failed." )
        if err then
            printError( err )
        end
        return nil
    end

    local response = http.get( sUrl , nil , true )
    if not response then
        print( "Failed." )
        return nil
    end

    -- print( "Success." )

    local sResponse = response.readAll()
    response.close()
    return sResponse
end
 
function WriteTo(path, data)
    local file = fs.open( sPath, "wb" )
    file.write( res )
    file.close()
    return true;
end
