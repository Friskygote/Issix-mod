# From UI/Inventory/InventoryScreen.gd

extends Control

onready var itemListContainer = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer2/VBoxContainer
var inventoryEntry = preload("res://UI/Inventory/InventoryEntry.tscn")
var inventoryGroupEntry = preload("res://UI/Inventory/InventoryGroupEntry.tscn")
onready var itemNameLabel = $MarginContainer/HBoxContainer/VBoxContainer/Label
onready var itemDescLabel = $MarginContainer/HBoxContainer/VBoxContainer/RichTextLabel
onready var searchInput = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer2/SearchLineEdit

#var inventory: Inventory
var itemsByGroup = {}
var selectedItem: ItemBase
var itemEntries = []
var filterEnteries = []

signal onInteractWith(item)
signal onInteractWithGroup(item)
signal onItemSelected(item)

var currentMode = ""
var isDonation = false
var isEnchant = false

var shouldGrabInput = true

func _ready():
	if(shouldGrabInput && !OS.has_touchscreen_ui_hint()):
		searchInput.grab_focus()

#func setInventory(inv, isFight = false):
	#if(inventory != inv || isFightMode != isFight):
	#	isFightMode = isFight
	#	inventory = inv
	#	updateInventory()

func setItems(newItems, theMode = "donation"):
	itemsByGroup = newItems
	currentMode = theMode
	isDonation = (theMode == "donation")
	isEnchant = (theMode == "enchant")
	updateInventory()
	filterInventory()

func filterInventory():
	var textToFilter = searchInput.text.to_lower()
	if(textToFilter == ""):
		for entry in filterEnteries:
			entry.visible = true
		return

	for entry in filterEnteries:
		var nameToCheck = entry.getItem().getVisibleName().to_lower()

		if(textToFilter in nameToCheck):
			entry.visible = true
		else:
			entry.visible = false

func updateInventory():
	Util.delete_children(itemListContainer)
	itemEntries = []
	filterEnteries = []

	#if(inventory == null):
	#	return

	var theItemsGrouped = itemsByGroup#inventory.getItemsAndEquippedItemsTogetherGrouped()
	if(theItemsGrouped is Array):
		var newItemsGrouped = {}
		for item in theItemsGrouped:
			if(!newItemsGrouped.has(item.id)):
				newItemsGrouped[item.id] = [item]
			else:
				newItemsGrouped[item.id].append(item)
		theItemsGrouped = newItemsGrouped

	for groupID in theItemsGrouped:
		var theItems = theItemsGrouped[groupID]

		if(theItems.size() == 1):
			var item = theItems[0]
			var entry = inventoryEntry.instance()
			itemListContainer.add_child(entry)
			itemEntries.append(entry)
			filterEnteries.append(entry)
			entry.setItem(item, currentMode)

			entry.connect("onInteractButtonPressed", self, "onEntryInteractButtonPressed")
			entry.connect("onItemSelected", self, "onEntrySelected")
		else:
			var newGroupEntry = inventoryGroupEntry.instance()
			itemListContainer.add_child(newGroupEntry)
			newGroupEntry.setItem(theItems[0], currentMode)
			filterEnteries.append(newGroupEntry)

			newGroupEntry.connect("onInteractButtonPressed", self, "onGroupEntryInteractButtonPressed")
			# add entry to some group entries maybe here
			for item in theItems:
				var entry = inventoryEntry.instance()
				newGroupEntry.addEntry(entry)
				entry.setItem(item, currentMode)
				itemEntries.append(entry)

				entry.connect("onInteractButtonPressed", self, "onEntryInteractButtonPressed")
				entry.connect("onItemSelected", self, "onEntrySelected")
			newGroupEntry.updateCollapsed()

	updateSelectedHighlight()

func updateSelectedHighlight():
	for entry in itemEntries:
		if(entry.getItem() == selectedItem):
			entry.setSelected(true)
		else:
			entry.setSelected(false)

func updateSelectedInfo():
	if(selectedItem == null):
		itemNameLabel.text = "Pick an item"
		itemDescLabel.bbcode_text = ""
		return
	itemNameLabel.text = selectedItem.getStackName()
	itemDescLabel.bbcode_text = selectedItem.getVisibleDescription()

	if isDonation:
		var price = selectedItem.getStackSellPrice()
		var priceStr = (str(price)+" credit") if price == 1 else (str(price)+" credits")
		itemDescLabel.bbcode_text += "\nSell value otherwise: " +priceStr
		if(selectedItem.getAmount() > 1):
			itemDescLabel.bbcode_text += " (for "+str(selectedItem.getAmount())+")"
	elif isEnchant:
		pass

func onEntryInteractButtonPressed(theItem):
	emit_signal("onInteractWith", theItem)

func onGroupEntryInteractButtonPressed(theItem):
	emit_signal("onInteractWithGroup", theItem)

func onEntrySelected(theItem):
	selectedItem = theItem
	updateSelectedInfo()
	updateSelectedHighlight()
	emit_signal("onItemSelected", selectedItem)


func _on_SearchLineEdit_text_changed(_new_text):
	filterInventory()
