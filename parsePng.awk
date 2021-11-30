BEGIN{
FS=",";
p=0
}

/<tr >/ {
    getline
    p=1;
}

/<\/tr>/ {
  p=0;
}

!/^($|[:space:]*#)/{
if (p == 1){
    id=$0;
    gsub("<th>","",id)
    gsub("</th>","",id)
     gsub(" ","",id)
    getline;
    idx=split($0, array, "\"");
    logo=array[2]l;
    getline;
    src=$0
    idx=index($0, "\">");
    lastIndex=index($0, "</a>");
    size= lastIndex - idx - 2;
    tagName=substr($0, idx + 2, size);
    gsub(" ","",tagName)
    getline;
    tagName2=$0;
    gsub("<td>","",tagName2)
    gsub("</td>","",tagName2)
    gsub(" ","",tagName2)
    getline;
    group=$0;
    gsub("<td>","",group)
    gsub("</td>","",group)
    gsub(" ","",group)
    getline;
    src=$0;
    gsub("<td>","",src)
    gsub("</td>","",src)
    gsub(" ","",src)
    getline;
    lastUpdatedDate=$0;
    gsub("<td>","",lastUpdatedDate)
    gsub("</td>","",lastUpdatedDate)
    gsub(" ","",lastUpdatedDate)
    print id, logo, tagName,tagName2, group, src, lastUpdatedDate;
}
}

END{
}