BEGIN{
}
{

   split($0, array, ",");
   name=array[2];
   getline;
   print name","$0;
}

END{
}