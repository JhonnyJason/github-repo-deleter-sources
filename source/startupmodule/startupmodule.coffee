
startupmodule = {name: "startupmodule"}

#region node_modules
chalk       = require('chalk')
clear       = require('clear')
figlet      = require('figlet')
#endregion

#log Switch
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["startupmodule"]?  then console.log "[startupmodule]: " + arg
    return

#region internal variables
deleteProcess = null
#endregion

##initialization function  -> is automatically being called!  ONLY RELY ON DOM AND VARIABLES!! NO PLUGINS NO OHTER INITIALIZATIONS!!
startupmodule.initialize = () ->
    log "startupmodule.initialize"
    deleteProcess = allModules.deleteprocessmodule

#region internal functions
printBanner = ->
    clear()
    console.log(
        chalk.green(
            figlet.textSync("Delete", { horizontalLayout: 'full' })
        )
    )
    console.log(
        chalk.green(
            figlet.textSync("Repos", { horizontalLayout: 'full' })
        )
    )

#endregion

#region exposed functions
startupmodule.cliStartup = ->
    log "startupmodule.cliStartup"
    printBanner()
    try
        done = await deleteProcess.execute()
        if done then console.log(chalk.green('All done!\n'));
    catch err
        console.log(chalk.red('Error!'));
        console.log(err)
        console.log("\n")

#endregion exposed functions

module.exports = startupmodule

