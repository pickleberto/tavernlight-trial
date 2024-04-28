//Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	Player* player = g_game.getPlayerByName(recipient);
	if (!player) {
		player = new Player(nullptr);
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			return;
		}
	}

	Item* item = Item::CreateItem(itemId);
	if (!item) {
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

	if (player->isOffline()) {
		IOLoginData::savePlayer(player);
	}
}

// Answer

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	// For this allocation, we can assume that the method 
	// will either return nullptr or use a smart pointer 
	// or even handle any memory allocated in itself
	Player* player = g_game.getPlayerByName(recipient);

	// Here we will need a flag to check when we create a new player
	bool isNewPlayer = false;
	if (!player) {
		player = new Player(nullptr);
		// as we create a player, set the flag
		isNewPlayer = true;
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			// before returnig we delete the player
			delete player;
			return;
		}
	}

	// For this allocation, we can assume the same as before
	Item* item = Item::CreateItem(itemId);
	if (!item) {
		// before returnig we check if it was a new Player instance to delete
		if (isNewPlayer) {
			delete player;
		}
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

	if (player->isOffline()) {
		IOLoginData::savePlayer(player);
	}

	// same here, before returnig we check if it was a new Player instance to delete
	if (isNewPlayer) {
		delete player;
	}
	// As we only allocate memory for the player pointer, we don't need to delete the item pointer
}