 
-- agentcards mod by chbinder

badges = {
    mod = "agentcards",
    version = "20240320",
    path = minetest.get_modpath("agentcards")
}

-- list of cards
local agentcards_texture_list = minetest.get_dir_list(badges.path .. "/textures")
local itemlist = {}

-- go over each texture, filter for id badges, remove leading "agentcards" and file extension ".png" and concatenate into itemlist
for _, filename in pairs(agentcards_texture_list) do
    local nameparts = string.gsub(filename, "[.]", "_"):split("_")
    if filename ~= "agentcards_handbook.png" and filename ~= "agentcards_serasum_nft.png" and filename ~="agentcards_cap.png" then
        if nameparts[#nameparts]:lower() == 'png' then
            table.remove(nameparts, 1)
            table.remove(nameparts, #nameparts)
            local name = table.concat(nameparts, "_")
            table.insert(itemlist, #itemlist, name)
        end

    end



end

for i in pairs(itemlist) do
        minetest.register_node("agentcards:"..itemlist[i], {
            description = "SERASUM Agent Badge (" .. itemlist[i] .. ")",
            inventory_image = "agentcards_" .. itemlist[i] .. ".png",
            tiles = {"agentcards_" .. itemlist[i] .. ".png"},
            paramtype = "signlike",
            groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand = 1},
            paramtype2 = "wallmounted",
            node_box = {type = "wallmounted"},
            stack_max = 1

        })

end

minetest.register_node("agentcards:handbook", {
            description = "SERASUM Agent Handbook",
            inventory_image = "agentcards_handbook.png",
            tiles = {"agentcards_handbook.png"},
            paramtype = "signlike",
            groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand = 1},
            paramtype2 = "wallmounted",
            node_box = {type = "wallmounted"},
            stack_max = 1

        })

minetest.register_craftitem("agentcards:serasum_nft", {
            description = "SERASUM NFT",
            inventory_image = "agentcards_serasum_nft.png",
            groups = {not_in_creative_inventory = 1},
            stack_max = 1,
            on_drop = function(itemstack, player)
                    local name = player:get_player_name()
                    minetest.chat_send_player(name, name .. ", don't throw away that precious NFT!")
                end
        })

minetest.register_craftitem("agentcards:graduation_cap", {
            description = "Graduation cap",
            inventory_image = "agentcards_caü.png",
            stack_max = 1
        })
