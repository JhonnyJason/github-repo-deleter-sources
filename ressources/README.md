# github-repo-deleter - Cli helper tool to fast delete many repositories from your github account.

# Why?
Developing on thingycreate the testing had spawned hunderets of unused repositories, which I would have to manually delete. The manual deletion process on the web-interface would take more time than writing this tool.

As I do think it could be usable for other people - so here the implementation of a cli helper tool ;-)

# How?
Installation
------------

Current git version
``` sh
$ npm install -g git+https://github.com/JhonnyJason/github-repo-deleter.git
```
Npm Registry
``` sh
$ npm install -g github-repo-deleter
```

Example
-----
``` sh
$ github-repo-deleter
  ____           _          _          
 |  _ \    ___  | |   ___  | |_    ___ 
 | | | |  / _ \ | |  / _ \ | __|  / _ \
 | |_| | |  __/ | | |  __/ | |_  |  __/
 |____/   \___| |_|  \___|  \__|  \___|
                                       
  ____                               
 |  _ \    ___   _ __     ___    ___ 
 | |_) |  / _ \ | '_ \   / _ \  / __|
 |  _ <  |  __/ | |_) | | (_) | \__ \
 |_| \_\  \___| | .__/   \___/  |___/
                |_|                  
? Github username: JhonnyJason
? Github password: [hidden]
  ◠ Checking credentials...Credentials Check succeeded!
? Check the repositories to delete. Please be careful - they will be deleted immediately!

 
 ◉ toolset-tester-output
 ◉ toolset-tester-testing
 ◉ toolset-tester-sources
❯◉ toolset-tester
 ◯ sample-source
 ◯ aurox-app-programs
 ◯ aurox-program-editor
(Move up and down to reveal more choices)

```
Current Functionality
---------------------

- Retrieves all Repositories owned by the user
- Inquirer Checkbox selection which repositories are to be deleted
- Immediately deletes all the repositories.

To Note: Be careful of what you delete - it's your responsibility one cat running over your keyboard could be desastrous!
---

# Further steps

- create configuration where you might set some repositories as never-delete so they won't show up at all

All sorts of inputs are welcome, thanks!

---

# License

## The Unlicense JhonnyJason style

- Information has no ownership.
- Information only has memory to reside in and relations to be meaningful.
- Information cannot be stolen. Only shared or destroyed.

And you whish it has been shared before it is destroyed.

The one claiming copyright or intellectual property either is really evil or probably has some insecurity issues which makes him blind to the fact that he also just connected information which was free available to him.

The value is not in him who "created" the information the value is what is being done with the information.
So the restriction and friction of the informations' usage is exclusively reducing value overall.

The only preceived "value" gained due to restriction is actually very similar to the concept of blackmail (power gradient, control and dependency).

The real problems to solve are all in the "reward/credit" system and not the information distribution. Too much value is wasted because of not solving the right problem.

I can only contribute in that way - none of the information is "mine" everything I "learned" I actually also copied.
I only connect things to have something I feel is missing and share what I consider useful. So please use it without any second thought and please also share whatever could be useful for others. 

I also could give credits to all my sources - instead I use the freedom and moment of creativity which lives therein to declare my opinion on the situation. 

*Unity through Intelligence.*

We cannot subordinate us to the suboptimal dynamic we are spawned in, just because power is actually driving all things around us.
In the end a distributed network of intelligence where all information is transparently shared in the way that everyone has direct access to what he needs right now is more powerful than any brute power lever.

The same for our programs as for us.

It also is peaceful, helpful, friendly - decent. How it should be, because it's the most optimal solution for us human beings to learn, to connect to develop and evolve - not being excluded, let hanging and destroy.

If we really manage to build an real AI which is far superior to us it will unify with this network of intelligence.
We never have to fear superior intelligence, because it's just the better engine connecting information to be most understandable/usable for the other part of the intelligence network.

The only thing to fear is a disconnected unit without a sufficient network of intelligence on its own, filled with fear, hate or hunger while being very powerful. That unit needs to learn and connect to develop and evolve then.

We can always just give information and hints :-) The unit needs to learn by and connect itself.

Have a nice day! :D