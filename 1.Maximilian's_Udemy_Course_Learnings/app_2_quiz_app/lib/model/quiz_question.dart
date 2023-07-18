class  QuizQuestion{
   const QuizQuestion(this.question,this.ans);

   final String question;
   final List<String> ans;

   List<String> getSuffledlist(){
    final List<String> allans= [...ans];
     allans.shuffle();
     return allans;

    //  final shuffledlist= List.of(ans);
    //   shuffledlist.shuffle();
    //   return shuffledlist;
   }
}