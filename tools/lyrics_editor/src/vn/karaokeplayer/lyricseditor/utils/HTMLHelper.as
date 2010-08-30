package vn.karaokeplayer.lyricseditor.utils {
	import vn.karaokeplayer.utils.TimeUtil;

	/**
	 * @author Thanh Tran
	 */
	public class HTMLHelper {
		
		public static function insertTimeMarkLink(htmlstr: String, caretIndex: int, timeValue: uint): String {
			var htmlIndex: int = HTMLHelper.calculateHtmlPosition(htmlstr, caretIndex);
			var newStr: String = htmlstr.substring(0, htmlIndex) + 
								 HTMLHelper.generateTimeMarkLink(timeValue) +
								 htmlstr.slice(htmlIndex);
			return newStr;
		}

		/**
		 * Generates a time mark HTML link
		 */
		public static function generateTimeMarkLink(timeValue: uint): String {
			var str: String = '<a href="event:' + timeValue + '"><font color="#FF0000">{' + TimeUtil.msToClockString(timeValue, true) + '}</font></a>';
			
			return str;
		}
		
		/**
		 * @param htmlstr	HTML string to search for
		 * @param newTime	new time value
		 * @param oldTime	old time to replace in the string
		 * @return new time mark link, null if oldTime is not found 
		 */
		public static function replaceTimeMarkLink(htmlstr: String, newTime: uint, oldTime: uint ): String {
			var result: Object = searchTimeMarkLink(htmlstr, oldTime);
			if(result) {
				var newTimeMark: String = generateTimeMarkLink(newTime);
				return result[1] + newTimeMark + result[2];
			} else {
				return null;	
			}
		}
		
		/**
		 * @return an object with 3 properties: [0] full matched string, [1] the string part before the time mark, [2] the string part after the time mark;<br/> null if time mark not found 
		 */
		public static function searchTimeMarkLink(htmlstr: String, timeValue: uint): Object {
			var pattern: String = '([\\w\\W]*)<a href="event:' + String(timeValue) + '">[\\w\\W]*?</a>([\\w\\W]*)';
			//trace('pattern: ' + (pattern));
			var reg: RegExp = new RegExp(pattern, "i");
			var result: Object = reg.exec(htmlstr);
			return result;
		}

		/**
		 * Calculates the correct index of character in HTML <br/>
		 * This function is from: http://www.flexer.info/2008/03/26/find-cursor-position-in-a-htmltext-object-richtexteditor-textarea-textfield-update/  
		 */
		public static function calculateHtmlPosition(htmlstr: String, pos: int): int {
			// we return -1 (not found) if the position is bad
			if (pos <= -1) return -1;
 
			// characters that appears when a tag starts
			var openTags: Array = ["<","&"];
			// characters that appears when a tag ends
			var closeTags: Array = [">",";"];
			// the tag should be replaced with
			// ex: &amp; is & and has 1 as length but normal 
			// tags have 0 length
			var tagReplaceLength: Array = [0,1];
			// flag to know when we are inside a tag
			var isInsideTag: Boolean = false;
			var cnt: int = 0;
			// the id of the tag opening found
			var tagId: int = -1;
			var tagContent: String = "";
 
			for (var i: int = 0;i < htmlstr.length;i++) {
				// if the counter passes the position specified
				// means that we reach the text position
				if (cnt >= pos) break;
				// current char	
				var currentChar: String = htmlstr.charAt(i);
				// checking if the current char is in the open tag array
				for (var j: int = 0;j < openTags.length;j++) {
					if (currentChar == openTags[j]) {
						// set flag
						isInsideTag = true;
						// store the tag open id
						tagId = j;
					}
				}
				if (!isInsideTag) {
					// increment the counter
					cnt++;
				} else {
					// store the tag content
					// needed afterwards to find new lines
					tagContent += currentChar;
				}
				if (currentChar == closeTags[tagId]) {
					// we ad the replace length 
					if (tagId > -1) cnt += tagReplaceLength[tagId];
					// if we encounter the </P> tag we increment the counter
					// because of new line character
					if (tagContent.toLowerCase() == "</p>" ||
						tagContent.toLowerCase() == "<br>" ||
						tagContent.toLowerCase() == "<br/>") 
						cnt++;
					// set flag 
					isInsideTag = false;
					// reset tag content
					tagContent = "";
				}
			}
			// return de position in html text
			return i;
		}
	}
}

internal class TextPostion {
	public var start: int;
	public var end: int;

}