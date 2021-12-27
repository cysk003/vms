BEGIN{
FS=",";
p=0
}

/<tr >/ {
    getline
    p=1;
}


/<tr[^>]*>/ {
    getline
    p=1;
}

/<\/tr>/ {
  p=0;
}

!/^($|[:space:]*#)/{
if (p == 1){
    seq=$0;
    gsub("<td[^>]*>","",seq)
    gsub("</td>","",seq)
     gsub(" ","",seq)
    getline;
    name=$0
    gsub("<td[^>]*>","",name)
    gsub("</td>","",name)
    gsub(" ","",name)
    getline;
    addr=$0
    gsub("<td[^>]*>","",addr)
    gsub("</td>","",addr)
    gsub(" ","",addr)
    getline;
    calldays=$0;
    gsub("<td[^>]*>","",calldays)
    gsub("</td>","",calldays)
    gsub(" ","",calldays)
    getline;
    channelId=$0;
    gsub("<td[^>]*>","",channelId)
    gsub("</td>","",channelId)
    gsub(" ","",channelId)
    getline;
    quality=$0;
    gsub("<td[^>]*>","",quality)
    gsub("</td>","",quality)
    gsub("<em[^>]*>","",quality)
    gsub("</em>","|",quality)
    gsub(" ","",quality)
    getline;
    callbackUrl=$0;
    gsub("<td[^>]*>","",callbackUrl)
    gsub("</td>","",callbackUrl)
    gsub(" ","",callbackUrl)
    print seq","name","addr","channelId","quality","callbackUrl;
}
}

END{
}