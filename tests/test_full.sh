for f in ./*.sh; do
  bash "$f" -H   || break
done
