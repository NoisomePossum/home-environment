function ddlog --wraps='python ~/cli-ddlogs-python/dd-forwarder.py' --description 'alias ddlog python ~/cli-ddlogs-python/dd-forwarder.py'
  python ~/cli-ddlogs-python/dd-forwarder.py $argv; 
end
