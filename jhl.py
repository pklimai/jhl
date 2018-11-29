#!/usr/bin/python3

from jnpr.junos import Device
from jnpr.junos.exception import *
import lxml

USER = "lab"
PASSWD = "lab123"
DEVICE = "10.254.0.41"
COMMAND = "show interfaces detail"

COLOR_MAIN = '\033[255m'       # black
COLOR_HIGHLIGHT = '\033[95m'   # magenta

with Device(host=DEVICE, user=USER, password=PASSWD) as dev:
    # Command output as CLI text
    text_resp = dev.cli(COMMAND, warning=False)

    # Convert to RPC and execute it
    rpc_string = dev.cli_to_rpc_string(COMMAND)
    exec("rpc_response = dev." + rpc_string)  # rpc_response is of type lxml.etree.Element

   #  lxml.etree.dump(rpc_response)

    # Build an array (list) of elements to highlight
    elements = rpc_response.findall(".//*")
    text_array = []
    for el in elements:
        format_attr = el.attrib.get("format")
        if format_attr is not None:
            text = format_attr
        else:
            text = el.text
        if text is not None:
            stripped_text = text.strip()
            if stripped_text not in ["",  "up", "enabled", "disabled", "none", "online"]:
                text_array.append(stripped_text)

    cur_text_item = 0
    print(COLOR_MAIN, end="")
    pos = 0
    while pos < len(text_resp) and cur_text_item < len(text_array):
        if text_resp[pos:pos+len(text_array[cur_text_item])] == text_array[cur_text_item]:
            print(COLOR_HIGHLIGHT, end="")
            print(text_array[cur_text_item], end="")
            print(COLOR_MAIN, end="")
            pos += len(text_array[cur_text_item])
            cur_text_item += 1
        else:
            print(text_resp[pos], end="")
            pos += 1
