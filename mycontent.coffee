
pagetop = document.getElementsByClassName('pagetop')[0]
newElement = ' | <span><a id="lohref" href="#">LinksOnly</a>'
 
# Insert the element into the page
pagetop.insertAdjacentHTML('beforeend', newElement)
lohref = document.getElementById("lohref")

# make comment links open in new window
links = document.querySelectorAll(".comment a:not([href^='reply?'])")
for link in links
  link.target = "_blank"
lohref.innerHTML = "LinksOnly (#{links.length})"

# make home page links open in new window
links = document.querySelectorAll('.title a')
for link in links
  link.target = "_blank" if link.text != "More"
    
linksOnly = false
toggleLinks = ->
  els = document.querySelectorAll('.comment')

  if linksOnly
    linksOnly = false
    for el in els
      el.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.style.display = 'block' 

  else
    linksOnly = true
    for el in els
      if el.querySelectorAll("a:not([href^='reply?'])").length < 1
        el.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.style.display = 'none' 

  
  
lohref.addEventListener('click', toggleLinks, false);

# add sort by date to search request
addByDate = ->
  
  f = document.querySelectorAll('form[action^="//hn"]')
  if f.length == 1
    f1 = f[0]
    el = document.createElement("INPUT");
    el.type="hidden"
    el.name="sort"
    el.value="byDate"
    f1.appendChild(el)

addByDate()
