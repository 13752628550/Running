# 04 Array Cardio ðª æåä¸

> ä½èï¼Â©[Soyaine](https://github.com/soyaine)  
> ç®ä»ï¼[JavaScript30](https://javascript30.com) æ¯ [Wes Bos](https://github.com/wesbos) æ¨åºçä¸ä¸ª 30 å¤©ææãé¡¹ç®åè´¹æä¾äº 30 ä¸ªè§é¢æç¨ã30 ä¸ªææçèµ·å§ææ¡£å 30 ä¸ªææè§£å³æ¹æ¡æºä»£ç ãç®çæ¯å¸®å©äººä»¬ç¨çº¯ JavaScript æ¥åä¸è¥¿ï¼ä¸åå©æ¡æ¶ååºï¼ä¹ä¸ä½¿ç¨ç¼è¯å¨åå¼ç¨ãç°å¨ä½ çå°çæ¯è¿ç³»åæåçç¬¬ 4 ç¯ãå®æ´æåå¨ [GitHub](https://github.com/soyaine/JavaScript30)ï¼åæ¬¢è¯· Star å¦âª(^â^*)

## å®ç°ææ

è¿ä¸é¨åä¸»è¦æ¯çæ Array çå ä¸ªåºæ¬æ¹æ³ï¼å¶ä¸­æä¸¤ä¸ªï¼filterãmapï¼æ¯ ES5 å®ä¹çè¿­ä»£æ¹æ³ï¼è¿äºè¿­ä»£æ¹æ³é½æä¸ä¸ªç¹ç¹ï¼å°±æ¯å¯¹æ°ç»çæ¯ä¸é¡¹é½è¿è¡ç»å®å½æ°ï¼æ ¹æ®ä½¿ç¨çè¿­ä»£æ¹æ³çä¸åï¼æä¸åçè¿åç»æã

ææ¡£ç»åºäºä¸ä¸ªåå§æä½ç inventor æ°ç»ï¼åºäºè¿ä¸ªæ°ç»å¯ä»¥ç»ä¹ ä¸ä¸ Array çåä¸ªæ¹æ³ï¼è¯·æå¼ HTML åå¨ Console é¢æ¿ä¸­æ¥çè¾åºç»æã

## ç«é·çè°è¯æå·§

å¨ Console ä¸­æä»¬å¸¸ç¨å°çå¯è½æ¯ `console.log()` ï¼ä½å®è¿æä¸ä¸ªå¾ç«çè¾åºï¼æç§è¡¨æ ¼æ¥è¾åºï¼ææå¦ä¸ï¼

```js
console.table(thing)
```

![console.table()](https://cl.ly/0H023s441o2d/Image%202016-12-23%20at%203.51.50%20PM.png)

## è¿ç¨æå

1. ç­é 16 ä¸çºªåºççåæå®¶  
2. å±ç¤ºä»ä»¬çå§åå  
3. æä»ä»¬æç§åºçæ¥æä»å¤§å°å°è¿è¡æåº
4. è®¡ç®ææçåæå®¶å èµ·æ¥ä¸å±æ´»äºå¤å°å²
5. æç§ä»ä»¬æ´»äºå¤ä¹æ¥è¿è¡æåº
6. ç­éåºä¸ä¸ªç½é¡µéå«ææä¸ªè¯è¯­çæ é¢
7. æç§å§æ°æ¥è¿è¡æåº
8. ç»è®¡ç»åºæ°ç»ä¸­åä¸ªç©åçæ°é

## ç¸å³ç¥è¯

ä¸é¢ä»ç®åçæ¹æ³å¼å§ï¼åé¢æå¾å¤æææçç©æ³ã

### [filter](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)

è¿æ»¤æä½ï¼æç¹å SQL éé¢ç select è¯­å¥ãç­åºè¿è¡ç»ææ¯ true çç»ææ°ç»è¿åã

````js
const __fifteen = inventors.filter(function(inventor) {
  if (inventor.year >= 1500 && inventor.year < 1600 ) {
	  return true;
  } else {
      return false;
  }
});
console.table(__fifteen);
````	  

åé¢å ç¯å·²ç»æå°è¿ç®­å¤´å½æ°ï¼è¿éå¯ä»¥ç®åä¸ä¸ï¼ç¨ç®­å¤´å½æ°æ¥åï¼èä¸ç±äº if è¯­å¥çå­å¨å¹¶ä¸æ¯å¿è¦çï¼å¯ä»¥åæä¸é¢è¿æ ·ï¼

````js
const fifteen = inventors.filter(inventor =>(inventor.year >= 1500 && inventor.year < 1600));
console.table(fifteen);
````

### [map](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

map å½¢è±¡ççè§£å°±æ¯ï¼ææ°ç»ä¸­çæ¯ä¸ªåç´ è¿è¡å¤çåï¼è¿åä¸ä¸ªæ°çæ°ç»ã

ä¾å­å¦ä¸ï¼

````js 
// å±ç¤ºæ°ç»å¯¹è±¡  inventors éåæå®¶çå§å  
const fullNames = inventors.map(inventor => inventor.first + ' ' + inventor.last);
````

### [sort](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)

é»è®¤æåµä¸ï¼`Array.prototype.sort()` ä¼å°æ°ç»ä»¥å­ç¬¦ä¸²çå½¢å¼è¿è¡ååºæåï¼10 ä¼æå¨ 2 ä¹åï¼ï¼ä½ sort ä¹å¯ä»¥æ¥åä¸ä¸ªå½æ°ä½ä¸ºåæ°ãæä»¥éè¦å¯¹æ°å­å¤§å°æåºæ¶éè¦èªå·±è®¾å®ä¸ä¸ªæ¯è¾å½æ°ï¼ä¾å­å¦ä¸ï¼

````js
const __ordered = inventors.sort((a, b) => (a > b) ? 1 : -1);
console.table(__ordered);
````

### filter å map çç»åä½¿ç¨

è¿ä¸¤ä¸ªç»åèµ·æ¥å¯ä»¥åä¸äºæææçäºæï¼ç±äºç¤ºèä»£ç ä¸­ç¨çé¡µé¢æ¯ Wikipediaï¼æéæ°æ¾äºä¸ªå½åçé¡µé¢ï¼æ¼ç¤ºå¦ä¸ï¼

ç­éåºè¿ä¸ä¸ªé¡µé¢ä¸­åå« CSS çä¹¦åãä»£ç å¦ä¸ï¼
````js
  // https://book.douban.com/tag/web
  const cate = document.querySelectorAll('.subject-list h2 a');
  const book = links
			.map(link => link.title)
			.filter(title => title.includes('CSS'));
````

![è±ç£ä¹¦å](https://cl.ly/3X2b3i3J4719/Image%202016-12-23%20at%2010.57.01%20AM.png)

é¤æ­¤ä¹å¤ï¼ä½ è¿å¯ä»¥å»èªå·±ä¸ªäººè®¢åçé¡µé¢çä¸ä¸ä»å¹´ä¹°è¿çä¹¦ï¼éè¦åçå°±æ¯ç ç©¶ä¸ä¸æ ç­¾ç class å¼æèæ¯å¶ä»è½å¤ç­åºæ¥çæ è¯ä¿¡æ¯ï¼ç¶åæé ä½ èªå·±çç­éè¯­å¥ã

éè¦æä¸ç¹ï¼ç± `querySelectorAll()` è·åå°çæ¯ä¸ä¸ª NodeList ï¼å®å¹¶éæ¯ Array ç±»åçæ°æ®ï¼æä»¥å¹¶ä¸å·æ `map` å `filter` è¿æ ·çæ¹æ³ï¼æä»¥å¦æè¦è¿è¡ç­éæä½åéè¦æå®è½¬åæ Array ç±»åï¼ä½¿ç¨ä¸é¢ç¤ºä¾ä¹ä¸­ç `Array.from()` æ¥è½¬åã

```js
var links = Array.from(document.querySelectorAll('#ordersContainer div.order div.a-row > a.a-link-normal'))

var object = order.map( order => {
var a = {};
var time = order.querySelector('.order-info span.value').textContent.trim();
var title = order.querySelector('div.a-row > a.a-link-normal').textContent.trim();
a["time"] = time;
return a;
})
```

![Amazon è®¢åç­é](http://ofjku7mlm.bkt.clouddn.com/16-12-23/51544750-file_1482484281402_1a92.png)

### [reduce](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)

è¿æ¯ä¸ä¸ªå½å¹¶æ°ç»çæ¹æ³ï¼å®æ¥åä¸ä¸ªå½æ°ä½ä¸ºåæ°ï¼è¿ä¸ªå½æ°å¯ä»¥çè§£æç´¯å å¨ï¼ï¼å®ä¼éåæ°ç»çææé¡¹ï¼ç¶åæå»ºä¸ä¸ªæç»çè¿åå¼ï¼è¿ä¸ªå¼å°±æ¯è¿ä¸ªç´¯å å¨çç¬¬ä¸ä¸ªåæ°ãä¾å­å¦ä¸ï¼

````js
[0,1,2,3,4].reduce(function(previousValue, currentValue, index, array){
  return previousValue + currentValue;
});
````

èæ­¤å¤æä»¬éè¦ç»è®¡ä¸ä¸ªç»å®æ°ç»ä¸­åä¸ªé¡¹çå¼ï¼æ°å¥½å¯ä»¥ç¨å°è¿ä¸ªæ¹æ³ï¼å¨ç´¯å å¨ä¹ä¸­ï¼å°ç»è®¡ä¿¡æ¯å­å¥ä¸ä¸ªæ°çå¯¹è±¡ï¼æåè¿åç»è®¡å¼ã

````js
  const data = ['car', 'car', 'truck', 'truck', 'bike', 'walk', 'car', 'van', 'bike', 'walk', 'car', 'van', 'car', 'truck' ];
  const reduce = data.reduce( (obj, item) => {
	  if( !obj[item]  ) {
		  obj[item] = 0;
	  }
		  obj[item]++;
		  return obj;
  }, {});
  console.log(reduce);
````

