debugmodule = {name: "debugmodule"}

##initialization function  -> is automatically being called!  ONLY RELY ON DOM AND VARIABLES!! NO PLUGINS NO OHTER INITIALIZATIONS!!
debugmodule.initialize = () ->
    console.log "debugmodule.initialize - nothing to do"

debugmodule.modulesToDebug = 
    unbreaker: true
    # deleteprocessmodule: true
    # deletioninquirermodule: true
    # githubhandlermodule: true
    # startupmodule: true

#region exposed variables

module.exports = debugmodule