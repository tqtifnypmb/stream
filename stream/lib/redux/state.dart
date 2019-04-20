
class ReduxState {

  List<Tweet> timelines() {
    return [
      Tweet(senderName: 'haha', avatarURL: 'https://img3.doubanio.com/icon/ul2771112-56.jpg', text: 'this looooooooong legs'),
      Tweet(senderName: 'kaka', avatarURL: 'https://img3.doubanio.com/icon/ul2771112-56.jpg', text: 'this goooooooood figure'),
      Tweet(senderName: 'jaja', avatarURL: 'https://img3.doubanio.com/icon/ul2771112-56.jpg', text: 'this yoooosdgsgsdgsdgjsdgsoooooooga\n\n\n\nsdlkfjsdf')
    ];
  }
}

class Tweet {
  final String senderName;
  final String avatarURL;
  final String text;
  final List<String> images;
  final Tweet reference;
  
  // Tweet({this.senderName, this.avatarURL, this.text, this.images, this.reference});
  Tweet({this.senderName, this.avatarURL, this.text}): this.images = [], this.reference = null;
}