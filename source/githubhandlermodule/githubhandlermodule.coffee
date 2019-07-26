githubhandlermodule = {name: "githubhandlermodule"}

OctokitREST = require("@octokit/rest")
inquirer    = require("inquirer")
c           = require('chalk')
CLI         = require('clui')
Spinner     = CLI.Spinner

#log Switch
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["githubhandlermodule"]?  then console.log "[githubhandlermodule]: " + arg
    return

#region internal variables
octokit = null

username = ""
password = ""

authQuestions = [ 
    {
        name: "username"
        type: "input"
        message: "Github username:"
        validate: (value) ->
            if value.length then return true;
            else return 'Please!'   
    },
    {
        name: "password"
        type: "password"
        message: "Github password:"
        validate: (value) ->
            if value.length then return true;
            else return 'Please!'   
    }    
]

twoFactorAuthentification = [
    {
        name: "twoFactorAuthenticationCode"
        type: "input"
        message: "2fa Code:"
        validate: (value) ->
            if value.length then return true;
            else return 'Please!'
    }
]
#endregion

#region exposed variables
#endregion

##initialization function  -> is automatically being called!  ONLY RELY ON DOM AND VARIABLES!! NO PLUGINS NO OHTER INITIALIZATIONS!!
githubhandlermodule.initialize = () ->
    log "githubhandlermodule.initialize"
    
#region internal functions
buildOctokit = ->    
    authenticated = false
    
    while !authenticated
        answers = await inquirer.prompt(authQuestions)
        status = new Spinner('Checking credentials...');
        
        options =
            auth:
                username: answers.username
                password: answers.password
                on2fa: -> 
                    status.stop()
                    answer = await inquirer.prompt(twoFactorAuthentification)
                    status.start()
                    return answer.twoFactorAuthenticationCode
            userAgent:"github-repo-deleter v0.1.0",
            baseUrl: "https://api.github.com"

        octokit = new OctokitREST(options)
        try
            status.start();
            info = await octokit.users.getAuthenticated()
            console.log(c.green("Credentials Check succeeded!"))
            username = answers.username
            password = answers.password
            authenticated = true
        catch err
            console.log(c.red("Credentials Check failed!"))
        finally status.stop()
#endregion

#region exposed functions
githubhandlermodule.buildConnection = ->
    if (octokit == null)
        await buildOctokit()

githubhandlermodule.retrieveAllUserRepositories = ->
    log "githubhandlermodule.retrieveAllUserRepositories"
    # TODO implement
    options = 
        visibility: "all"
        affiliation: "owner"
        sort: "updated"
        per_page: 100
        direction: "asc"
        page: 0

    results = []
    loop
        answer = await octokit.repos.list(options)
        #else return resultskeys = Object.keys(answer)
        keys = Object.keys(answer)
        data = answer.data
        names = (repo.name for repo in data)
        options.page++    
        if names.length then results = results.concat(names)
        else return results
        
    return


githubhandlermodule.deleteUserRepository = (repo) ->
    if (octokit == null)
        await buildOctokit()
    
    result = await octokit.repos.delete({owner:username,repo:repo})
    #console.log(result)
    return

githubhandlermodule.deleteReposForUser = (repos) ->
    log "githubhandlermodule.deleteAllRepos"
    status = new Spinner('Deleting the repositories...');
    try
        status.start()
        promises =  (githubhandlermodule.deleteUserRepository(repo) for repo in repos)
        await Promise.all(promises)
    finally status.stop()
    return

#endregion

module.exports = githubhandlermodule