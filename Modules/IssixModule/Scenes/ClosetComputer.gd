extends ComputerBase

const Globals = preload("res://Modules/IssixModule/Globals.gd")

var connectedTo = ""
var loggedAsAdmin = false
var records = {"533": "ID: 533\nfirstname: Issix\nlastname: [corrupt]Solomon[/corrupt]\nitype: 1\n\nnotes: Issix, or rather [b]Gaap[/b] as his real real name goes, is a special case in BDCC, staff is NOT to take any punitive action in regards to this individual without first consulting with the director. He has not been convicted of any illegal activities, but rather has been introduced to prison based on order o[corrupt]f general Sonno[/corrupt]fer. \nOfficially - he is an inmate, unofficially he is is untouchable. Let him do whatever the fuck he wants, unless you don't value your own life. Incarcerated in [corrupt]4292 32 11[/corrupt].",\
"655": "ID: 655\nfirstname: Frisk\nlastname: Dreemurr\nitype: 3\nnotes: Past inhabitant of planet [b]Pu[corrupt]e[/corrupt]ri Meritorii[/b], sentenced for sex work with untreated STD. Serving until [corrupt]20291 328 119[/corrupt].\nServing time has been extended to indefinite due to circumstances in the prison. \nHe doesn't hold any prospects of becoming an agent, behavioral data shows all he is good for is being a weak, obedient sex toy.\nNote by user ID 10: „lol, can confirm the last thing, they are grade S slut, recommending a good gag though, they have proclivity to spew some bullshit when getting fucked, I barely fucking survived them giving a lesson on philosophy and morality in prison environment, for the love of Intergalactic Squid make them shut up before use.”\n\nNOTE: THIS INMATE IS OWNED BY INMATE 533, PLEASE REFER TO MENTIONED INMATE ABOUT ALL MATTERS PERTAINING TO THIS INMATE",\
"790": "ID: 790\nfirstname: Lamia\nlastname: null\nitype: 1\n\nnotes: Past inhabitant of planet [b]Vulpor Pespetcho[/b], sentenced for trespassing, refusal to ID to AlphaCorp officer, threatening behavior. We could not properly ID the person, officer at [corrupt]serving[/corrupt] outpost indicated that inmate might be connected to planet's local tribes. Serving until [corrupt]20291 328 119[/corrupt]. \nServing time has been extended to indefinite due to circumstances in the prison.\nNo prospects of becoming an agent.\nNote added by user ID 222: „this documentation sucks fucking ass, why nobody indicated at intro that the inmate is fucking mute? They've been penalized for not answering a guard until a doctor pointed out that they can't even fucking speak!”\n\nNOTE: THIS INMATE IS OWNED BY INMATE 533, PLEASE REFER TO MENTIONED INMATE ABOUT ALL MATTERS PERTAINING TO THIS INMATE",\
"964": "ID: 964\nfirstname: Hiisi\nlastname: Rzeszczyk\nitype: 2\n\nnotes: Past inhabitant of planet [b]Ciecieszyn[/b], sentenced for assault and kidnapping. Serving until [corrupt]20291 328 119[/corrupt].\nServing time has been extended to indefinite due to circumstances in the prison.\nNo prospects of becoming an agent - too unpredictable.\nNote added by user ID 400: „Avoid if you can, strong and fuck around often causing trouble with other inmates. Multiple incidents with guards.”\nNote added by user ID 392: „we need to do something about this fucker, ha has hurt XXXXX and XXXXXXXX (redacted) and solitary cell doen't help a bit. We need a long term solution.”\nNote added by user ID 1: „Shouldn't cause any more issues.”\n\nNOTE: THIS INMATE IS OWNED BY INMATE 533, PLEASE REFER TO MENTIONED INMATE ABOUT ALL MATTERS PERTAINING TO THIS INMATE"}
# 12429 tavi
func _init():
	id = "ClosetComputer"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	if (connectedTo == "inmates.db"):
		if _command == "SELECT":
			if _args.size() == 3:
				if _args[1].to_lower() == "inmates":
					var record = records.get(_args[2]) if _args[2] != GM.pc.getInmateNumber() else preparePCRecord()
					if record == null:
						return "No record with primary key of `"+_args[1]+"` has been found!"
					return printRecord(record)
				else:
					return "Table `"+_args[1]+"` couldn't be found!"
			else:
				return "`sqleasy` supports only read operations using SELECT."

		if _command == "help":
			return "sqleasy makes SQL easy for you! Instead of knowing all this useless syntax, you only need to know the table name, ID from the primary key and SELECT!\n\nSyntax: SELECT <table name> <ID>         show record\nquit            close the database\n\nIt will show you all columns corresponding to a record with given ID!\n©Lain (YOU ARE USING UNLICENSED COPY, PLEASE ACTIVATE YOUR VERSION WITH A LICENSE!)"

		if _command in ["quit", "disconnect", "q", "exit"]:
			connectedTo = "127.0.223"
			return "Closing database... Success"


	if(connectedTo == "127.0.223"):
		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]

				if(tolearn == "disconnect"):
					return "Closes the connection"
				elif(tolearn == "login"):
					return "Allows you to login as an admin. Syntax: login <password>"
				elif(tolearn == "ls"):
					return "This command outputs the contents of your hard drive"
				elif(tolearn == "cat"):
					return "This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				elif(tolearn == "sqleasy"):
					return "This command opens a database file for simple operations\nSyntax 'sqleasy <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				return "No help found for that command"
			learnCommand("disconnect")
			learnCommand("login")
			learnCommand("ls")
			learnCommand("cat")
			learnCommand("sqleasy")
			return "Available commands:\ndisconnect\nlogin\nls\ncat\nsqleasy"

		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				loggedAsAdmin = false
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"

		if(_command == "sqleasy"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "inmates.db"]):
					if loggedAsAdmin:
						connectedTo = "inmates.db"
						return "Opening inmates.db... Opened successfully."
					else:
						return "sqleasy: inmates.db: Permission denied"
				else:
					return "Error. File with such index wasn't found"
			else:
				return "'sqleasy' command expects 1 argument"

		if(_command == "login"):
			if(loggedAsAdmin):
				return "Already logged in"

			if(_args.size() == 1):
				var modeStr = _args[0]
				if(modeStr == "OWNERSHIP"):
					loggedAsAdmin = true
					return "Logged in as admin successfully. Welcome, administrator."
				return "Error, wrong password"

		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found 1 file:\n1 - inmates.db"
			else:
				return "This command expects 0 arguments"

		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "inmates.db"]):
					if loggedAsAdmin:
						return "�v�KtablefilesfilesCREATE TABLE inmates (\nid INTEGER NOT NULL, \nfirst_name TEXT, \nlast_name TEXT, \nitype INTEGER, \nnotes TEXT, \nPRIMARY KEY (id)\n#��������������������������{uoic]WQKE?93-'!     smga[UOIC=71+% [corrupt]garbaaaageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee[/corrupt]\n"
					else:
						return "cat: inmates.db: Permission denied"
				else:
					return "Error. File with such index wasn't found"
			else:
				return "'cat' expects 1 argument"

		return "Error, server doesn't support this command"

	if connectedTo == "127.0.222":
		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found 1 file:\n1 - info.txt"
			else:
				return "This command expects 0 to 1 arguments"

		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "info.txt"]):
					return "Hia! Currently it's just a testing branch of the story. Feel free to leave using disconnect. there is nothing here."

		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"

	if(connectedTo == ""):
		if(_command == "connect"):
			if(_args.size() == 1):
				var server = _args[0]
				if(server in ["127.0.223", "127.0.222"]):
					connectedTo = server
					if(server == "127.0.223"):
						var last_login = GM.main.getModuleFlag("IssixModule", "Last_Login_Server", GM.main.getDays()-2)
						GM.main.setModuleFlag("IssixModule", "Last_Login_Server", GM.main.getDays())
						return "Connecting to "+server+"... Connected!\nLast login: "+str(GM.main.getDays()-last_login)+" days ago."
					if server == "127.0.222":
						return "Connecting to "+server+"... Connected!\n\n@@------ OPENCLUE CLIENT SERVER ------@@\nCI: "+str(RNG.randi_range(400, 900))+"  IN: "+str(RNG.randi_range(0, 4000))
				else:
					return "Connecting to "+server+"... Connection failed!"
			else:
				return "'connect' expects 1 argument"

		if _command == "sudo":
			return "sudo has been disabled by system administrator for security reasons"

		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found 3 files:\n1 - inmates.txt\n2 - forum.html\n4 - #support_log_BDCCHAT.log"
			elif(_args.size() == 1):
				if (_args[0] in ["-a", "--all"]):
					return "Found 2 files:\n1 - inmates.txt\n2 - forum.html\n3 - .dash_history\n4 - #support_log_BDCCHAT.log"
				else:
					return "Unknown flag "+_args[0]
			else:
				return "This command expects 0 to 1 arguments"

		if _command == "rm":
			return "/bin/rm: Segmentation fault"  # sorry, too lazy to implement this

		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "inmates.txt"]):
					return "Please for the love of Intergalactic Squid - when you log into the database server (the one at 127.0.223) with goddamn inmate data, log out of it when you are done!!! AlphaOS has limited amount of sessions per server because apparently they invented the computers just now and are figuring trivial issues like that only now. Fuck."
				elif(fileIndex in ["2", "forum.html"]):
					return "...**[corrupt]corrupted data[/corrupt]**...\n\n<message>Anyone knows what's the status of black goo we've ordered?</message>\n<message>Black goo? What black goo?</message>\n<message>can it be used as lube?</message>\n<message>fuck, I hope so, the one from vendomat is way too watery</message>\n<message>No, it cannot be used as a lube you horny bitches, it's for engineering purposes, we need it to minimize friction in metallic joints of mechanic arms</message>\n<message>so what you are saying is that it's lube</message>\n<message>I hate you guys</message>\n<message>The vessel that supposed to have black goo didn't have it, we re-ordered it</message>\n<message>Finally an answer! Thank you!</message>\n<message>Sure thing, by the way, we ordered double the amount due to request from the guards</message>\n<message>Why do guards need black go- Oh for fuck's sake</message>\n\n...**[corrupt]more corrupted data[/corrupt]**..."
				elif fileIndex in ["3", ".dash_history"]:
					learnCommand("sudo")
					learnCommand("rm")
					return "sudo journal -n 1000\nsudo install robor vulcan\nsudo system start openclue-server\nsudo system status openclue-server\ncat passwords.txt\ncinnect 127.0.222\nsudo system start openclue\nopposite_THUMB222-\nfuck\nrm passwords.txt\nconnect 127.0.222\nquit"
				elif fileIndex in ["3", "#support_log_BDCCHAT.log"]:
					return "bazinga has joined the channel\n<bazinga> hey guys, i could swear I've made a file on medical computer but it isn't there, did any of you delete it?\n<alex> was it important?\n<thunder022> have you tried ls?\n<alex> i can look at the logs assuming it's not porn\n<bazinga> unless you want the entire station to get infested with little works - it was important\n<thunder022> wtff?\n<alex> fine, i'll take a look\n<bazinga> nvm, i named it with a dot at beginning so I needed a flag for all files, sorry guys!\nbazinga has left the chat\n<alex> you've made a file at 04:55 and it's still there, but you made it hidden\n<alex> eh, always late\n<thunder022> better for us, he will take care of that worm issue\n<alex> with that file name? doubt it\n<thunder022> what was it?\n<alex> .juicydonutsOwO\n<thunder022> hahahahah, classic bazinga"
				else:
					return "Error. File with such index wasn't found"
			else:
				return "'cat' expects 1 argument"
		if(_command == "quit"):
			markFinishedFail()
			return "Shutting down.."

		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]
				if(tolearn == "help"):
					return "This command outputs all other commands and can also provide help for certain command by typing 'help <COMMAND>'"
				elif(tolearn == "ls"):
					return "This command outputs the contents of your hard drive"
				elif(tolearn == "cat"):
					return "This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				elif(tolearn == "connect"):
					return "This command lets you connect to the remote server by using its ip.\nSyntax 'connect <IP>'. An example of an ip is 127.0.1"
				elif(tolearn == "quit"):
					return "Shutdown the console"
				else:
					return "Couldn't find command '"+str(tolearn)+"'. To see all the available commands type 'help'"

			elif(_args.size() == 0):
				learnCommand("help")
				learnCommand("ls")
				learnCommand("cat")
				learnCommand("connect")
				learnCommand("quit")
				return "Available commands are: ls, cat, connect, help, quit.\nTo learn more about a command type 'help <COMMAND>'"
			else:
				learnCommand("help")
				return "'help' expects 0 or 1 arguments"

		learnCommand("help")
		return "Error, unknown command. Use 'help' to list all available commands"


func preparePCRecord() -> String:
	var player_crimes = {Flag.Crime_Type.Innocent: "pleaded innocent, got sentenced with no evidence (typical)", Flag.Crime_Type.Theft: "sentenced for theft of property", Flag.Crime_Type.Murder: "sentenced for murder", Flag.Crime_Type.Prostitution: "sentenced for providing sexual services without a license"}
	var output = "ID: "+GM.pc.getInmateNumber()+"\nfirstname: "+GM.pc.getName()+"\nlastname: [corrupt]noidea[/corrupt]\nitype: "+str(InmateType.getAll().find(GM.pc.inmateType)+1)
	output += "\n\nnotes: [corrupt]Past inhabitant of planet -------------- [/corrupt], sentenced for "+player_crimes.get(GM.main.getFlag("Player_Crime_Type"))+". Indefinite sentence" + (", requires permission of inmate 533 for release." if Globals.checkIfPCEnslaved() else ".")
	if GM.main.getModuleFlag("TaviModule", "Ch5BigSceneStarted", false):
		output += "\nNote added by user ID 1: „Attempted to escape the facility [color=red]TWICE(!!!!)[/color] using violence, recommended close watch and maximum caution. Any suspicious activity, especially when {pc.he} {pc.is} in close proximity to inmate Tavi has to be reported to captain.”"  # note escapades with tavi
	elif GM.main.getModuleFlag("TaviModule", "Ch3TurnedOffPower", false) or GM.main.getModuleFlag("TaviModule", "Ch3SpikedPower", false):
		output += "\nNote added by user ID 1: „Attempted to escape the facility using violence, recommended close watch and maximum caution. Any suspicious activity, especially when {pc.he} {pc.is} in close proximity to inmate Tavi has to be reported to captain.”"
	if Globals.checkIfPCEnslaved():
		output += "\n\nNOTE: THIS INMATE IS OWNED BY INMATE 533, PLEASE REFER TO MENTIONED INMATE ABOUT ALL MATTERS PERTAINING TO THIS INMATE"
	return output

func printRecord(record:String) -> String:
	return record

func saveData():
	var data = .saveData()

	data["connectedTo"] = connectedTo
	data["loggedAsAdmin"] = loggedAsAdmin

	return data

func loadData(data):
	.loadData(data)

	connectedTo = SAVE.loadVar(data, "connectedTo", "")
	loggedAsAdmin = SAVE.loadVar(data, "loggedAsAdmin", false)
