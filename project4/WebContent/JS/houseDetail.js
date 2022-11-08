function dateDiff(startDate, endDate) {
	if (startDate === '' || endDate === '') return 1;
    var start = new Date(startDate);
    var end = new Date(endDate);
 
    start = new Date(start.getFullYear(), start.getMonth()+1, start.getDate());
    end = new Date(end.getFullYear(), end.getMonth()+1, end.getDate());
 
    var diff = Math.abs(end.getTime() - start.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}
function calcResult(e, type) {
	var startDate = type === 'start' ? e.target.value : document.getElementById('startDate').value;
    var endDate = type === 'end' ? e.target.value : document.getElementById('endDate').value;
    var price = Number(document.getElementById('houseprice').value);
    var diff = dateDiff(startDate, endDate);
    document.getElementById('count').value = diff;
    document.getElementById('result').value = diff * price;
}