deleteprocessmodule = {name: "deleteprocessmodule"}

#log Switch
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["deleteprocessmodule"]?  then console.log "[deleteprocessmodule]: " + arg
    return

#region internal variables
github = null
deletionInquirer = null
#endregion

##initialization function  -> is automatically being called!  ONLY RELY ON DOM AND VARIABLES!! NO PLUGINS NO OHTER INITIALIZATIONS!!
deleteprocessmodule.initialize = () ->
    log "deleteprocessmodule.initialize"
    github = allModules.githubhandlermodule
    deletionInquirer = allModules.deletioninquirermodule

#region internal functions
#endregion

#region exposed functions
deleteprocessmodule.execute = () ->
        await github.buildConnection()
        reposToDelete = await deletionInquirer.doUserInquiry()
        await github.deleteReposForUser(reposToDelete)
        return true
#endregion

module.exports = deleteprocessmodule
