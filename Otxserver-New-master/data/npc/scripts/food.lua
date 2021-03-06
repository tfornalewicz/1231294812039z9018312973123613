local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end

local voices = {
	{text = 'Ten Lidl ciagle probuje kopiowac moje promocje...'},
	{text = 'Promocja na piersi z kurczaka i stejki ! Robcie zapasy !'},
	{text = 'Swieze warzywa i owoce w korzystnych cenach !'},
	{text = 'Dostawcy bananow dalej nie spelniaja wymogow unijnych wzgledem ich krzywizny...A kare zaplace ja !'},
	{text = 'Kukurydza, ziemniaki, marchew, rzodkiew, wszystko bez GMO ! '} }
	
npcHandler:addModule(VoiceModule:new(voices))

-- OTServ event handling functions end
-- ============ DO MISJI TRUDNE POCZATKI =============
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
   
	local player = Player(cid)


   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11025) < 1 then
        player:setStorageValue(11025,1) -- lockujemy biedronke jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Nie potrzeba, ale jakbys znal jakis sposob na pozbycie sie raz na zawsze szczurow to sie do mnie zglos', cid)
--    24/04/17
-- Q2
   elseif (msgcontains(msg,"szczur") or msgcontains(msg,"szczury")) and player:getStorageValue(11046) == 2 and player:getItemCount(2235) > 0 then
   		selfSay('Jestes pewien czy to dziala? Mimo wszystko dzieki za pamiec. Trzymaj odemnie taki maly upominek.',cid)
		player:setStorageValue(11046,3) -- koniec klesta
		-- Q5.1
		player:addExperience(50000,true) -- 50k expa
		-- Q5.1
		player:addItem(10000,1) -- dostaje carrot cake
   end
-- Q2
--    24/04/17   
end
-- ============ DO MISJI TRUDNE POCZATKI =============
-- Start shop
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

--shopModule:addSellableItem({'Juice Squeezer'}, 5865, 100) 
shopModule:addSellableItem({'Meat'}, 2666, 2, 'Meat')
shopModule:addSellableItem({'Ham'}, 2671, 15)
--shopModule:addSellableItem({'Green Perch'}, 7159, 10000) 
--shopModule:addSellableItem({'Northern Pike'}, 2669, 5000) 
--shopModule:addSellableItem({'Rainbow Trout'}, 7158, 15000) 
shopModule:addSellableItem({'Cheese'}, 2696, 2)
shopModule:addSellableItem({'Carrot'}, 2684, 3) 
shopModule:addSellableItem({'Salmon'}, 2668, 2) 
shopModule:addSellableItem({'Blueberry'}, 2677, 1, 'Blueberry')
shopModule:addSellableItem({'Cherry'}, 2679, 1) 
shopModule:addSellableItem({'Cookie'}, 2687, 3) 
shopModule:addSellableItem({'Cocktail Glass'}, 10150, 50)
shopModule:addSellableItem({'Golden Mug'}, 2033, 250) 

-------------------player buys
--food
shopModule:addBuyableItem({'Baking Tray'}, 2561, 20, 1)
shopModule:addBuyableItem({'Meat'}, 2666, 10, 1)
--shopModule:addBuyableItem({'Pumpkin'}, 2683, 10, 1) 
shopModule:addBuyableItem({'Ham'}, 2671, 15, 1) 
shopModule:addBuyableItem({'Bread'}, 2689, 8, 1) 
shopModule:addBuyableItem({'Brown Bread'}, 2691, 4, 1) 
shopModule:addBuyableItem({'Cake'}, 6278, 50, 1) 
shopModule:addBuyableItem({'Dragon Ham'}, 2672, 25, 1) 
shopModule:addBuyableItem({'Ice Cream Cone'}, 7372, 10, 1) 
shopModule:addBuyableItem({'Melon'}, 2682, 13, 1) 
shopModule:addBuyableItem({'Cheese'}, 2696, 12, 1) 
--shopModule:addBuyableItem({'Mango'}, 5097, 10, 1) 
shopModule:addBuyableItem({'Scarab Cheese'}, 8112, 100, 1) 
shopModule:addBuyableItem({'Fish'}, 2667, 6, 1) 
shopModule:addBuyableItem({'Valentine\'s Cake'}, 6393, 100, 1) 
shopModule:addBuyableItem({'Corncob'}, 2686, 3, 1) 
shopModule:addBuyableItem({'Roll'}, 2690, 2, 1) 
--shopModule:addBuyableItem({'Carrot'}, 2684, 8, 1) 
shopModule:addBuyableItem({'Salmon'}, 2668, 7, 1) 
shopModule:addBuyableItem({'Jalapeno Pepper'}, 8844, 2, 1) 
shopModule:addBuyableItem({'Cucumber'}, 8842, 5, 1) 
shopModule:addBuyableItem({'Grapes'}, 2681, 8, 1) 
--shopModule:addBuyableItem({'Bulb of Garlic'}, 9114, 4) 
shopModule:addBuyableItem({'Onion'}, 8843, 2, 1) 
shopModule:addBuyableItem({'Pear'}, 2673, 5, 1) 
--shopModule:addBuyableItem({'Beetroot'}, 8845, 2, 1) 
shopModule:addBuyableItem({'Plum'}, 8839, 3, 1) 
shopModule:addBuyableItem({'Red Apple'}, 2674, 5, 1) 
--shopModule:addBuyableItem({'Banana'}, 2676, 5, 1) 
shopModule:addBuyableItem({'Blueberry'}, 2677, 1, 1) 
shopModule:addBuyableItem({'Cherry'}, 2679, 1, 1) 
shopModule:addBuyableItem({'Lemon'}, 8841, 3, 1) 
shopModule:addBuyableItem({'Raspberry'}, 8840, 1, 1) 
shopModule:addBuyableItem({'Potato'}, 8838, 5, 1) 
shopModule:addBuyableItem({'Tomato'}, 2685, 10, 1) 
--shopModule:addBuyableItem({'Red Mushroom'}, 2788, 12, 1) 
shopModule:addBuyableItem({'Strawberry'}, 2680, 2, 1) 
--shopModule:addBuyableItem({'Orange'}, 2675, 10, 1) 
--shopModule:addBuyableItem({'Cookie'}, 2687, 5, 1) 
shopModule:addBuyableItem({'White Mushroom'}, 2787, 10, 1)  
shopModule:addBuyableItem({'Brown Mushroom'}, 2789, 10, 1)
--liquid containers
shopModule:addBuyableItem({'Amphora'}, 2023, 4, 0)
shopModule:addBuyableItem({'Bottle'}, 2007, 3, 0)
shopModule:addBuyableItem({'Bucket'}, 2005, 4, 0)
shopModule:addBuyableItem({'Cup'}, 2013, 3, 0)
shopModule:addBuyableItem({'Jug'}, 2014, 10, 0)
shopModule:addBuyableItem({'Mug'}, 2012, 4, 0)
shopModule:addBuyableItem({'Pot'}, 2562, 30, 0)
shopModule:addBuyableItem({'Rum Flask'}, 5553, 150, 27)
shopModule:addBuyableItem({'Vase'}, 2008, 3, 0)
shopModule:addBuyableItem({'Waterskin'}, 2031, 10, 1)
shopModule:addBuyableItem({'Holy Water'}, 7494, 200000, 1)


-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())
-- MISJA TREUDNE POCZATKI
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
-- MISJA TREUDNE POCZATKI
