extends ComputerBase

var connectedTo = ""
var loggedAsAdmin = false

func _init():
	id = "ClosetComputer"

func reactToCommand(_command:String, _args:Array, _commandStringRaw:String):
	if (connectedTo == "inmates.db"):
		pass

	if(connectedTo == "127.0.223"):  # TODO Finish computer UwU
		if(_command == "help"):
			if(_args.size() == 1):
				var tolearn = _args[0]

				if(tolearn == "disconnect"):
					return "Closes the connection"
				elif(tolearn == "login"):
					return "Allows you to login as an admin. Syntax: login <password>"
				elif(tolearn == "ls"):
					return "This command outputs the contents of your harddrive"
				elif(tolearn == "cat"):
					return "This command outputs file's contents into the console.\nSyntax 'cat <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				elif(tolearn == "sqlopen"):
					return "This command opens a database file for simple operations\nSyntax 'sqlopen <FILE INDEX>' where file index is a [b]number[/b] that can be obtained by using the ls command"
				return "No help found for that command"
			learnCommand("disconnect")
			learnCommand("login")
			learnCommand("ls")
			learnCommand("cat")
			learnCommand("sqlopen")
			return "Available commands:\ndisconnect\nlogin\nls\ncat\nsqlopen"

		if(_command == "disconnect"):
			if(_args.size() == 0):
				connectedTo = ""
				loggedAsAdmin = false
				return "Disconnecting... Success"
			else:
				return "'disconnect' command expects 0 arguments"

		if(_command == "sqlopen"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "inmates.db"]):
					connectedTo = "inmates.db"
					return "Opening inmates.db... Opened successfully."
				else:
					return "Error. File with such index wasn't found"
			else:
				return "'sqlopen' command expects 1 argument"

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
						return "�v�KtablefilesfilesCREATE TABLE inmates (\nid INTEGER NOT NULL, \nfirst_name TEXT, \nlast_name TEXT, \ndescription TEXT, \nPRIMARY KEY (id)\n#��������������������������{uoic]WQKE?93-'!     smga[UOIC=71+% [corrupt]garbaaaageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee[/corrupt]\n"
					else:
						return "cat: inmates.db: Permission denied"
				else:
					return "Error. File with such index wasn't found"
			else:
				return "'cat' expects 1 argument"

		return "Error, server doesn't support this command"

	if(connectedTo == ""):
		if(_command == "connect"):
			if(_args.size() == 1):
				var server = _args[0]
				if(server in ["127.0.223"]):
					connectedTo = server
					if(server == "127.0.223"):
						var last_login = GM.main.getModuleFlag("IssixModule", "Last_Login_Server", GM.main.getDays()-2)
						GM.main.setModuleFlag("IssixModule", "Last_Login_Server", GM.main.getDays())
						return "Connecting to "+server+"... Connected!\nLast login: "+str(GM.main.getDays()-last_login)+" days ago."
				else:
					return "Connecting to "+server+"... Connection failed!"
			else:
				return "'connect' expects 1 argument"

		if(_command == "ls"):
			if(_args.size() == 0):
				return "Found 2 files:\n1 - inmates.txt\n2 - forum.html"
			elif(_args.size() == 1):
				if (_args[0] in ["-a", "--all"]):
					return "Found 2 files:\n1 - inmates.txt\n2 - forum.html\n3 - .dash_history"
				else:
					return "Unknown flag "+_args[0]
			else:
				return "This command expects 0 to 1 arguments"
		if(_command == "cat"):
			if(_args.size() == 1):
				var fileIndex = _args[0]
				if(fileIndex in ["1", "inmates.txt"]):
					return "Please for the love of intergalactic squid - when you log into the database server (the one at 127.0.223) with goddamn inmate data, log out of it when you are done!!! AlphaOS has limited amount of sessions per server because apparently they invented the computers just now and are figuring trivial issues like that only now. Fuck."
				elif(fileIndex in ["2", "forum.html"]):
					return "...**[corrupt]corrupted data[/corrupt]**...\n\n<message>Anyone knows what's the status of black goo we've ordered?</message>\n<message>Black goo? What black goo?</message>\n<message>can it be used as lube?</message>\n<message>fuck, I hope so, the one from vendomat is way too watery</message>\n<message>No, it cannot be used as a lube you horny bitches, it's for engineering purposes, we need it to minimize friction in metallic joints of mechanic arms</message>\n<message>so what you are saying is that it's lube</message>\n<message>I hate you guys</message>\n<message>The vessel that supposed to have black goo didn't have it, we re-ordered it</message>\n<message>Finally an answer! Thank you!</message>\n<message>Sure thing, by the way, we ordered double the amount due to request from the guards</message>\n<message>Why do guards need black go- Oh for fuck's sake</message>\n\n...**[corrupt]more corrupted data[/corrupt]**..."
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
					return "This command outputs the contents of your harddrive"
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

func saveData():
	var data = .saveData()

	data["connectedTo"] = connectedTo
	data["loggedAsAdmin"] = loggedAsAdmin

	return data

func loadData(data):
	.loadData(data)

	connectedTo = SAVE.loadVar(data, "connectedTo", "")
	loggedAsAdmin = SAVE.loadVar(data, "loggedAsAdmin", false)
