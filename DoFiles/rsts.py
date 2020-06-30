with open('InstRst.do', 'w') as f:
    for i in range(2048):
        f.write(f"force -freeze sim:/processor/InstMemoryFX/RAM({i}) 0000000000000000 0\n")