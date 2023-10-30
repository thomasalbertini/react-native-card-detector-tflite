import VisionCamera

@objc(cardDetectorTflitePlugin)
public class cardDetectorTflitePlugin: FrameProcessorPlugin {
  public override init(options: [AnyHashable: Any]! = [:]) {
    super.init(options: options)
  }

  public override func callback(_ frame: Frame, withArguments arguments: [AnyHashable: Any]?) -> Any? {
    let buffer = frame.buffer
    let orientation = frame.orientation
    // code goes here

    guard let modelPath = Bundle.main.path(forResource: "mobilenet_quant_v1_224", ofType: "tflite") else { print("Failed to load the model."); return nil }

    var options = InterpreterOptions()
    options.threadCount = 1
    do {
      // Initialize as Interpreter
      interpreter = try Interpreter(modelPath: modelPath, options: options)
      // Allocate memory for the input tensor
      try interpreter.allocateTensors()
    } catch let error {
      print("Failed to create the interpreter with error: \(error.localizedDescription)")
      return nil
    }
    return nil
  }
}