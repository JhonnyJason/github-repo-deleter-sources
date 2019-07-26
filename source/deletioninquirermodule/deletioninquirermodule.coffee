deletioninquirermodule = {name: "deletioninquirermodule"}

#region node_modules
inquirer = require("inquirer")
CLI         = require('clui')
Spinner     = CLI.Spinner
#endregion


#log Switch
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["deletioninquirermodule"]?  then console.log "[deletioninquirermodule]: " + arg
    return

#region internal variables
utl = null
github = null
githubRemoteHandler = null
#endregion

#region exposed variables
#endregion

##initialization function  -> is automatically being called!  ONLY RELY ON DOM AND VARIABLES!! NO PLUGINS NO OHTER INITIALIZATIONS!!
deletioninquirermodule.initialize = () ->
    log "deletioninquirermodule.initialize"
    utl = allModules.utilmodule
    github = allModules.githubhandlermodule
    githubRemoteHandler = allModules.githubremotehandlermodule

#region internal functions

createDeletionQuestion = (repos) -> 
    return [
        {
            name: "reposToDelete",
            type: "checkbox",
            message: "Check the repositories to delete. Please be careful - they will be deleted immediately!\n\n",
            choices: repos
        }
    ]

#endregion

#region exposed functions
deletioninquirermodule.doUserInquiry = ->
    log "deletioninquirermodule.doUserInquiry"
    status = new Spinner('Retrieving all repositories you own...');
    try
        status.start()
        allRepos = await github.retrieveAllUserRepositories()
    finally status.stop()
    log "length of result: " + allRepos.length
    log JSON.stringify(allRepos, null, 2)
    question = createDeletionQuestion(allRepos)
    answers = await inquirer.prompt(question)
    reposToDelete = answers.reposToDelete
    return reposToDelete

#endregion

module.exports = deletioninquirermodule