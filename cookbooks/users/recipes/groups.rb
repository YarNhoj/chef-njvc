search(:groups, "*:*").each do |gd|
	group gd["id"] do
		gid gd["gid"]
		members gd["members"]
	end
end
