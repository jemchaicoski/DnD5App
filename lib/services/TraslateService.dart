import 'package:translator/translator.dart';

class TranslatorService{
  GoogleTranslator translator = new GoogleTranslator();

  translateTextEnToPt(String text){
    return translator.translate(text, from: 'en', to: 'pt');
  }
}