// Test file for microScript Zed extension
// This file demonstrates syntax highlighting, outline, and other features

// Simple function definition
add = function(a, b) // inline comment
  return a + b
end

// Function with default parameter
greet = function(name = "World")
  return "Hello, " + name + "!"
end

// Function call
greet("Alice")

// Class definition
Player = class
  constructor = function(x, y)
    this.x = x
    this.y = y
    this.speed = 5
    this.health = 100
  end

  update = function()
    if keyboard.LEFT then
      this.x -= this.speed
    elsif keyboard.RIGHT then
      this.x += this.speed
    end

    if keyboard.UP then
      this.y -= this.speed
    elsif keyboard.DOWN then
      this.y += this.speed
    end
  end

  draw = function()
    screen.fillRect(this.x, this.y, 20, 20, "#FF0000")
  end

  takeDamage = function(amount)
    this.health -= amount
    if this.health <= 0 then
      this.die()
    end
  end

  die = function()
    // Handle player death
  end
end

// Class with inheritance
Enemy = class extends Player
  constructor = function(x, y)
    super(x, y)
    this.speed = 2
    this.damage = 10
  end

  update = function()
    // AI movement logic
    local dx = player.x - this.x
    local dy = player.y - this.y

    if dx > 0 then
      this.x += this.speed
    elsif dx < 0 then
      this.x -= this.speed
    end
  end
end

// Object definition (singleton-like)
config = object
  width = 800
  height = 600
  title = "My Game"
  debug = false
end

// Variables and operators
score = 0
multiplier = 1.5
isGameOver = false
highScores = [100, 200, 300, 400, 500]

// Arithmetic operators
result = 10 + 5 * 2 - 3 / 1
power = 2 ^ 8
remainder = 17 % 5

// Comparison operators
isEqual = score == 0
isNotEqual = score != 100
isGreater = score > 50
isLess = score < 100

// Logical operators
canPlay = not isGameOver and score >= 0
shouldReset = isGameOver or score < 0

// Bitwise operators
flags = 0b1010 | 0b0101
masked = flags & 0xFF
shifted = flags << 2

// Control flow - if/elsif/else
checkScore = function()
  if score >= 1000 then
    return "S Rank"
  elsif score >= 500 then
    return "A Rank"
  elsif score >= 250 then
    return "B Rank"
  else
    return "C Rank"
  end
end

// While loop
countdown = function(n)
  while n > 0
    print(n)
    n -= 1
  end
  print("Go!")
end

// For loop with range
sumRange = function(start, finish)
  local total = 0
  for i = start to finish
    total += i
  end
  return total
end

// For loop with step
countByTwo = function()
  for i = 0 to 10 by 2
    print(i)
  end
end

// For-in loop (iterate over collection)
printScores = function()
  for score in highScores
    print(score)
  end
end

// Break and continue
findFirst = function(list, target)
  for item in list
    if item == target then
      return item
    end
  end
  return 0
end

// Async constructs
setupTimers = function()
  // Do block - execute asynchronously
  do
    print("Starting async task...")
  end

  // After block - delayed execution
  after 2 seconds do
    print("2 seconds later!")
  end

  // Every block - repeated execution
  every 1 seconds do
    score += 1
  end

  // Sleep statement
  sleep 500 milliseconds
end

// Anonymous function (closure)
createCounter = function()
  local count = 0
  return function()
    count += 1
    return count
  end
end

// Member access and method calls
init = function()
  player = new Player(100, 100)
  player.health = 100
  player.update()
  player.draw()

  screen.clear()
  screen.drawText("Score: " + score, 10, 10, 20, "#FFFFFF")
end

// Built-in variables
useBuiltins = function()
  print(this.x)
  super.update()
end

// String literals
message = "Hello, World!"
singleQuote = 'Also valid'
escaped = "Line 1\nLine 2\tTabbed"

// Global variable
global.version = "1.0"

// Number literals
integer = 42
decimal = 3.14159
scientific = 1.5e10
hexadecimal = 0xFF00FF
negative = -100

// Boolean literals
enabled = true
disabled = false

/*
  Multi-line comment block
  This is useful for longer explanations
  or temporarily disabling code
*/

// Main game loop functions (microStudio convention)
init = function()
  player = new Player(0, 0)
end

update = function()
  player.update()
end

draw = function()
  screen.clear()
  player.draw()
  screen.drawText("Score: " + score, -140, 80, 12, "#FFF")
end

// JavaScript injection - single line string
runJS = function()
  system.javascript("console.log('Hello from JS')")
end

// JavaScript injection - triple quoted string (multiline)
runComplexJS = function()
  system.javascript("""
    const result = {
      name: 'test',
      value: 42
    };
    console.log(JSON.stringify(result));
  """)
end

// ============================================================================
// SCREEN API EXAMPLES
// ============================================================================

// Screen properties
getScreenInfo = function()
  print("Screen width: " + screen.width)
  print("Screen height: " + screen.height)
end

// Clear screen
clearExamples = function()
  screen.clear()
  screen.clear("#000000")
  screen.clear("rgb(0,0,0)")
  screen.clear("rgba(0,0,0,1)")
  screen.clear("#FFF")
  screen.clear("hsl(0,0%,100%)")
end

// Set color examples
colorExamples = function()
  screen.setColor("#FF0000")
  screen.setColor("rgb(255,0,0)")
  screen.setColor("rgba(255,0,0,1)")
  screen.setColor("#F00")
  screen.setColor("hsl(0,100%,50%)")
  screen.setColor("hsla(0,100%,50%,1)")
end

// Rectangle drawing
rectExamples = function()
  screen.fillRect(0, 0, 100, 100)
  screen.fillRect(0, 0, 100, 100, "#FF0000")
  screen.fillRoundRect(0, 0, 100, 100, 10)
  screen.fillRoundRect(0, 0, 100, 100, 10, "#00FF00")
  screen.fillRound(0, 0, 100, 80)
  screen.fillRound(0, 0, 100, 80, "#0000FF")

  screen.drawRect(0, 0, 100, 100)
  screen.drawRect(0, 0, 100, 100, "#FFFFFF")
  screen.drawRoundRect(0, 0, 100, 100, 10)
  screen.drawRoundRect(0, 0, 100, 100, 10, "#FFFF00")
  screen.drawRound(0, 0, 100, 80)
  screen.drawRound(0, 0, 100, 80, "#FF00FF")
end

// Line drawing
lineExamples = function()
  screen.setLineWidth(2)
  screen.setLineWidth(5)

  screen.setLineDash([2, 4])
  screen.setLineDash([5, 5])
  screen.setLineDash([])

  screen.drawLine(-50, -50, 50, 50)
  screen.drawLine(-50, 50, 50, -50, "#00FFFF")
end

// Polygon drawing
polygonExamples = function()
  screen.fillPolygon(-50, -50, 50, -50, 0, 50)
  screen.fillPolygon([-50, -50, 50, -50, 0, 50], "#FF0000")

  screen.drawPolygon(-50, -50, 50, -50, 0, 50)
  screen.drawPolygon([-50, -50, 50, -50, 0, 50], "#00FF00")

  screen.drawPolyline(-50, -50, 50, -50, 0, 50)
  screen.drawPolyline([-50, -50, 50, -50, 0, 50], "#0000FF")
end

// Arc drawing
arcExamples = function()
  screen.drawArc(0, 0, 50, 0, 90)
  screen.drawArc(0, 0, 50, 0, 90, false, "#FF0000")
  screen.fillArc(0, 0, 50, 0, 180)
  screen.fillArc(0, 0, 50, 0, 180, false, "#00FF00")
  screen.fillArc(0, 0, 50, 0, 360, true, "#0000FF")
end

// Curve drawing
curveExamples = function()
  screen.drawQuadCurve(-50, 0, 0, -50, 50, 0)
  screen.drawQuadCurve([-50, 0, 0, -50, 50, 0], "#FF0000")

  screen.drawBezierCurve(-50, 0, -25, -50, 25, -50, 50, 0)
  screen.drawBezierCurve([-50, 0, -25, -50, 25, -50, 50, 0], "#00FF00")
end

// Text drawing
textExamples = function()
  screen.drawText("Hello World!", 0, 0, 30)
  screen.drawText("Hello World!", 0, 0, 30, "#FFFFFF")

  screen.drawTextOutline("Outlined", 0, 50, 30, "#000000")

  screen.setLineWidth(3)
  screen.drawTextOutline("Thick Outline", 0, -50, 30, "#FF0000")

  local width = screen.textWidth("Sample Text", 20)
  print("Text width: " + width)

  screen.setFont("BitCell")
  screen.setFont("PressStart2P")
  screen.setFont("PixelOperator")
end

// Font loading
fontExamples = function()
  screen.loadFont("DigitalDisco")
  screen.loadFont("CustomFont")

  if screen.isFontReady() then
    screen.setFont("BitCell")
    screen.drawText("Default font ready", 0, 0, 20)
  end

  if screen.isFontReady("DigitalDisco") then
    screen.setFont("DigitalDisco")
    screen.drawText("Custom font ready", 0, 30, 20)
  end
end

// Sprite drawing
spriteExamples = function()
  screen.drawSprite("icon", 0, 0, 50)
  screen.drawSprite("player", -50, 0, 64, 64)
  screen.drawSprite("enemy", 50, 0, 50)

  // Draw specific frame
  screen.drawSprite("anim_sprite.0", 0, 0, 50)
  screen.drawSprite("anim_sprite.5", 50, 0, 50)

  // Sprite part
  screen.drawSpritePart("sheet", 0, 0, 32, 32, 0, 0, 32)
  screen.drawSpritePart("sheet", 32, 0, 32, 32, 50, 0, 32)

  // Set sprite properties
  sprites["anim_sprite"].fps = 10
  sprites["anim_sprite"].setFPS(12)
  sprites["anim_sprite"].setFrame(0)
end

// Map drawing
mapExamples = function()
  screen.drawMap("level1", 0, 0, 300, 200)
  screen.drawMap("dungeon", -100, -50, 400, 300)

  // Access map properties
  local mapWidth = maps["level1"].width
  local mapHeight = maps["level1"].height
  local tileSprite = maps["level1"].get(0, 0)
  maps["level1"].set(5, 5, "wall_tile")
end

// Image drawing
imageExamples = function()
  screen.drawImage(loadedImage, 0, 0, 100)
  screen.drawImage(loadedImage, -50, -50, 200, 200)

  screen.drawImagePart(loadedImage, 0, 0, 32, 32, 0, 0, 64)
end

// Drawing transformations
transformExamples = function()
  // Translation
  screen.setTranslation(50, 50)
  screen.fillRect(0, 0, 20, 20, "#FF0000")
  screen.setTranslation(0, 0)

  // Rotation
  screen.setRotation(45)
  screen.fillRect(0, 0, 100, 100, "#00FF00")
  screen.setRotation(0)

  // Scale
  screen.setScale(2, 2)
  screen.fillRect(0, 0, 50, 50, "#0000FF")
  screen.setScale(1, 1)
end

// Per-element transformations
elementTransformExamples = function()
  // Anchor point
  screen.setDrawAnchor(-1, -1)
  screen.setDrawAnchor(0, 0)
  screen.setDrawAnchor(1, 1)

  // Element rotation
  screen.setDrawRotation(45)
  screen.drawSprite("icon", 0, 0, 50)
  screen.setDrawRotation(0)

  // Element scale
  screen.setDrawScale(2, 2)
  screen.drawSprite("icon", 0, 0, 50)
  screen.setDrawScale(1, 1)

  // Flip sprite
  screen.setDrawScale(-1, 1)
  screen.drawSprite("player", 0, 0, 50)
  screen.setDrawScale(1, -1)
  screen.drawSprite("player", 0, 50, 50)
  screen.setDrawScale(1, 1)
end

// Alpha and blending
alphaBlendingExamples = function()
  screen.setAlpha(0.5)
  screen.setAlpha(0.25)
  screen.setAlpha(1.0)

  screen.setBlending("normal")
  screen.setBlending("additive")
  screen.setBlending("multiply")
  screen.setBlending("screen")
  screen.setBlending("overlay")
  screen.setBlending("lighter")
end

// Gradients
gradientExamples = function()
  screen.setLinearGradient(0, 100, 0, -100, "#FFFFFF", "#FF0000")
  screen.fillRect(0, 0, screen.width, screen.height)

  screen.setRadialGradient(0, 0, 100, "#FFFFFF", "#0000FF")
  screen.fillRect(0, 0, screen.width, screen.height)
end

// Pixelated rendering
pixelatedExamples = function()
  screen.setPixelated(true)
  screen.setPixelated(false)
  screen.drawSprite("pixel_art", 0, 0, 64)
end

// Cursor visibility
cursorExamples = function()
  screen.setCursorVisible(true)
  screen.setCursorVisible(false)
end

// ============================================================================
// INPUT API EXAMPLES
// ============================================================================

// Keyboard input
keyboardExamples = function()
  if keyboard.A then
    print("A pressed")
  end

  if keyboard.SPACE then
    print("Space pressed")
  end

  if keyboard.UP then
    print("Up arrow pressed")
  end

  if keyboard["+"] then
    print("Plus key pressed")
  end

  // Key press detection (once per press)
  if keyboard.press.A then
    print("A was just pressed")
  end

  // Key release detection
  if keyboard.release.A then
    print("A was just released")
  end

  // List pressed keys
  draw = function()
    local y = 80
    for key in keyboard
      if keyboard[key] then
        screen.drawText(key, 0, y, 15, "#FFF")
        y -= 20
      end
    end
  end
end

// Mouse input
mouseExamples = function()
  local mouseX = mouse.x
  local mouseY = mouse.y

  if mouse.pressed then
    print("Mouse button pressed")
  end

  if mouse.left then
    print("Left button clicked")
  end

  if mouse.right then
    print("Right button clicked")
  end

  if mouse.middle then
    print("Middle button clicked")
  end

  if mouse.press then
    print("Mouse button just pressed")
  end

  if mouse.release then
    print("Mouse button just released")
  end

  local wheel = mouse.wheel
end

// Touch input
touchExamples = function()
  if touch.touching then
    print("Touching screen")
  end

  local touchX = touch.x
  local touchY = touch.y

  if touch.press then
    print("Touch started")
  end

  if touch.release then
    print("Touch ended")
  end

  // Multiple touch points
  draw = function()
    for t in touch.touches
      screen.drawSprite("icon", t.x, t.y, 50)
    end
  end
end

// Gamepad input
gamepadExamples = function()
  if gamepad.UP then
    print("Gamepad up")
  end

  if gamepad.A then
    print("Button A pressed")
  end

  if gamepad.press.A then
    print("Button A just pressed")
  end

  if gamepad.release.B then
    print("Button B just released")
  end

  local angle = gamepad.LEFT_STICK_ANGLE
  local amount = gamepad.LEFT_STICK_AMOUNT

  // Multiple gamepads
  if gamepad[0].A then
    print("Player 1 button A")
  end

  if gamepad[1].B then
    print("Player 2 button B")
  end
end

// Input availability check
inputCheckExamples = function()
  if system.inputs.keyboard then
    print("Keyboard available")
  end

  if system.inputs.mouse then
    print("Mouse available")
  end

  if system.inputs.touch then
    print("Touch screen available")
  end

  if system.inputs.gamepad then
    print("Gamepad available")
  end
end

// ============================================================================
// AUDIO API EXAMPLES
// ============================================================================

// Sound playback
soundExamples = function()
  local sound = audio.playSound("jump")
  local sound2 = audio.playSound("jump", 0.5)
  local sound3 = audio.playSound("jump", 1.0, 1.5, 0, 0)

  sound.setVolume(0.5)
  sound.setVolume(1.0)

  sound.setPitch(1.0)
  sound.setPitch(2.0)

  sound.setPan(-1)
  sound.setPan(0)
  sound.setPan(1)

  local duration = sound.getDuration()
  sound.stop()

  // Looping sound
  local loopSound = audio.playSound("music", 0.5, 1, 0, 1)
  loopSound.stop()
end

// Music playback
musicExamples = function()
  local music = audio.playMusic("background")
  local music2 = audio.playMusic("background", 0.5)
  local music3 = audio.playMusic("background", 1.0, 1)

  music.setVolume(0.5)
  music.stop()
  music.play()

  local pos = music.getPosition()
  local dur = music.getDuration()
  music.setPosition(30)
end

// Beep generator
beepExamples = function()
  audio.beep("C4 E G C5")
  audio.beep("C E G C5 E G")
  audio.beep("volume 50 C4 E G")
  audio.beep("tempo 120 C4 D4 E4 F4")
  audio.beep("loop 0 C4 E G end")
  audio.beep("saw duration 100 span 50 volume 50 loop 4 C2 C F G end")

  audio.cancelBeeps()
end

// ============================================================================
// STORAGE API EXAMPLES
// ============================================================================

storageExamples = function()
  storage.set("highscore", 1000)
  storage.set("player_name", "Hero")
  storage.set("settings", object
    sound = true
    music = false
    volume = 80
  end)

  local high = storage.get("highscore")
  local name = storage.get("player_name")
  local settings = storage.get("settings")
  local missing = storage.get("nonexistent")
end

// ============================================================================
// SYSTEM API EXAMPLES
// ============================================================================

systemExamples = function()
  local time = system.time()
  print("Current time: " + time)

  local lang = system.language
  print("Language: " + lang)

  local fps = system.fps
  print("FPS: " + fps)

  system.say("Game Paused")

  system.prompt("Enter your name:", function(ok, text)
    if ok then
      print("Hello " + text)
    end
  end)

  system.pause()

  system.exit()

  system.update_rate = 60
  system.update_rate = 120

  system.preemptive = 1
  system.preemptive = 0

  system.disable_autofullscreen = 1
end

// ============================================================================
// ASSET MANAGER EXAMPLES
// ============================================================================

assetManagerExamples = function()
  // Load font
  asset_manager.loadFont("fonts/mylabel")

  // Load JSON
  asset_manager.loadJSON("data/config", function(data)
    local config = data
    print(config.setting)
  end)

  local jsonLoader = asset_manager.loadJSON("data/levels")
  if jsonLoader.ready then
    local levels = jsonLoader.data
  end

  // Load text
  asset_manager.loadText("files/readme", function(text)
    print(text)
  end)

  // Load CSV
  asset_manager.loadCSV("data/scores", function(csv)
    print(csv)
  end)

  // Load markdown
  asset_manager.loadMarkdown("docs/help", function(md)
    print(md)
  end)

  // Load 3D model (with Babylon.js or micro3D)
  asset_manager.loadModel("models/character", function(container)
    container.addAllToScene()
  end)

  // WebAssembly
  asset_manager.wasmInstance("modules/math", function(instance)
    local add = instance.exports.add
    print(add(2, 3))
  end)
end

// ============================================================================
// PROJECT API EXAMPLES
// ============================================================================

projectExamples = function()
  if system.project then
    // List files
    system.project.listFiles("source", function(list, error)
      for file in list
        print(file)
      end
    end)

    system.project.listFiles("sprites", function(list, error)
      print(list)
    end)

    // Read files
    system.project.readFile("source/main", function(result, error)
      print(result)
    end)

    system.project.readFile("sprites/player", function(sprite, error)
      screen.drawSprite(sprite, 0, 0, 50)
    end)

    system.project.readFile("maps/level1", function(map, error)
      screen.drawMap(map, 0, 0, 320, 200)
    end)

    system.project.readFile("assets/config", function(obj, error)
      print(obj.setting)
    end)

    // Write files
    system.project.writeFile("source/generated", "code here", 0, function(result, error)
      print(result)
    end)

    system.project.writeFile("sprites/generated/new_sprite", sprite, 0, function(result, error)
      print(result)
    end)

    // Delete files
    system.project.deleteFile("source/temp", function(result, error)
      print(result)
    end)
  end
end

// ============================================================================
// MAP API EXAMPLES
// ============================================================================

mapCreationExamples = function()
  local gameMap = new Map(10, 10, 32, 32)

  local tile = gameMap.get(0, 0)
  gameMap.set(0, 0, "grass")
  gameMap.set(5, 5, "water")

  local w = gameMap.width
  local h = gameMap.height
  local ready = gameMap.ready

  local copy = gameMap.clone()
end

// ============================================================================
// IMAGE API EXAMPLES
// ============================================================================

imageCreationExamples = function()
  local img = new Image(100, 100)
  local img2 = new Image(64, 64, true)

  local w = img.width
  local h = img.height

  img.clear()
  img.clear("#FFFFFF")

  img.setRGB(0, 0, 255, 0, 0)
  img.setRGBA(1, 1, 0, 255, 0, 128)

  local color = img.getRGB(0, 0)
  local colorAlpha = img.getRGBA(0, 0)

  // Drawing on image (pixel coordinates, origin top-left)
  img.setColor("#FF0000")
  img.fillRect(10, 10, 50, 50)
  img.setFont("BitCell")
  img.drawText("Text", 10, 50, 20)

  // Save image
  system.file.save(img, "screenshot.png")
  system.file.save(img, "screenshot.jpg", "jpg", 0.9)
end

// ============================================================================
// SPRITE API EXAMPLES
// ============================================================================

spritePropertyExamples = function()
  local sprite = sprites["player"]

  local width = sprite.width
  local height = sprite.height
  local name = sprite.name
  local ready = sprite.ready

  sprite.fps = 10
  sprite.setFPS(12)
  sprite.setFrame(0)

  local firstFrame = sprite.frames[0]
  sprite.frames.push(loadedFrame)
end

// ============================================================================
// FILE API EXAMPLES
// ============================================================================

fileLoadExamples = function()
  // With callback
  system.file.load(["png", "jpg"], function(file_list)
    for file in file_list
      print(file.content)
    end
  end)

  // Without callback
  system.file.load(["json", "txt"])

  update = function()
    if system.file.loaded then
      for file in system.file.loaded
        print(file.content)
      end
    end
  end

  // File dropped
  update = function()
    if system.file.dropped then
      for file in system.file.dropped
        print(file.content)
      end
    end
  end
end

fileSaveExamples = function()
  // Save object as JSON
  system.file.save(myObject, "data.json")

  // Save image
  system.file.save(myImage, "image.png")

  // Save sound
  system.file.save(mySound, "sound.wav")
end

// ============================================================================
// ADVANCED EXAMPLES
// ============================================================================

// Particle system
Particle = class
  constructor = function(x, y)
    this.x = x
    this.y = y
    this.vx = random(-2, 2)
    this.vy = random(-2, 2)
    this.life = 60
    this.color = "#FF0000"
  end

  update = function()
    this.x += this.vx
    this.y += this.vy
    this.life -= 1
  end

  draw = function()
    screen.setAlpha(this.life / 60)
    screen.fillRect(this.x, this.y, 5, 5, this.color)
    screen.setAlpha(1)
  end
end

particles = []

spawnParticle = function(x, y)
  particles.push(new Particle(x, y))
end

updateParticles = function()
  for i = particles.length - 1 to 0 by -1
    particles[i].update()
    if particles[i].life <= 0 then
      particles.remove(i)
    end
  end
end

drawParticles = function()
  for p in particles
    p.draw()
  end
end

// Simple state machine
GameState = object
  MENU = 0
  PLAYING = 1
  PAUSED = 2
  GAME_OVER = 3
end

currentState = GameState.MENU

stateMachine = function()
  if currentState == GameState.MENU then
    // Show menu
    if keyboard.press.SPACE then
      currentState = GameState.PLAYING
    end
  elsif currentState == GameState.PLAYING then
    // Game logic
    if keyboard.press.ESCAPE then
      currentState = GameState.PAUSED
    end
  elsif currentState == GameState.PAUSED then
    // Show pause screen
    if keyboard.press.ESCAPE then
      currentState = GameState.PLAYING
    end
  elsif currentState == GameState.GAME_OVER then
    // Show game over
    if keyboard.press.R then
      currentState = GameState.MENU
    end
  end
end

// Save/load game
saveGame = function()
  local saveData = object
    score = score
    level = currentLevel
    playerHealth = player.health
    inventory = inventory
    timestamp = system.time()
  end
  storage.set("savegame", saveData)
end

loadGame = function()
  local saveData = storage.get("savegame")
  if saveData then
    score = saveData.score
    currentLevel = saveData.level
    player.health = saveData.playerHealth
    inventory = saveData.inventory
  end
end

// Collision detection
checkCollision = function(a, b)
  local dx = a.x - b.x
  local dy = a.y - b.y
  local dist = sqrt(dx * dx + dy * dy)
  return dist < (a.radius + b.radius)
end

// Simple pathfinding
findPath = function(start, goal)
  local path = []
  local current = start.clone()

  while current != goal
    local next = findBestNextStep(current, goal)
    path.push(next)
    current = next
  end

  return path
end

// ============================================================================
// LANGUAGE FEATURES
// ============================================================================

typeCheckExamples = function()
  local num = 42
  local str = "hello"
  local lst = [1, 2, 3]
  local fn = function() end
  local obj = object x = 1 end

  if num.type == "number" then print("It's a number") end
  if str.type == "string" then print("It's a string") end
  if lst.type == "list" then print("It's a list") end
  if fn.type == "function" then print("It's a function") end
  if obj.type == "object" then print("It's an object") end
  if undefinedVar.type == 0 then print("Variable not defined") end
end

randomExamples = function()
  local rand = random.next()
  local dice = random.nextInt(6) + 1
  local dice10 = random.nextInt(10)

  random.seed(12345)
  local reproducible = random.next()

  local rng = random.clone()
  rng.seed(99)
  local clonedRand = rng.next()

  local rng2 = random.clone(42)
end

threadControlExamples = function()
  local counter = 0
  local thread = every 1 seconds do
    counter += 1
    print("Thread running: " + counter)
  end

  sleep 2000
  thread.pause()
  print("Thread paused")

  sleep 2000
  thread.resume()
  print("Thread resumed")

  sleep 2000
  thread.stop()
  print("Thread stopped")

  for t in system.threads
    t.pause()
  end
end

conditionalExpressionExamples = function()
  local score = 85
  sign_x = if score >= 0 then "positive" else "negative" end
  print("Sign: " + sign_x)

  grade = if score >= 90 then "A" elsif score >= 80 then "B" else "C" end

  local result = if isGameOver then "Game Over" else "Playing" end

  value = if condition then 100 else 0 end
end

implicitReturnExamples = function()
  square = function(x) x * x end
  cube = function(x) x * x * x end
  absolute = function(n) if n >= 0 then n else -n end
  negate = function(n) -n end

  print("square(5) = " + square(5))
  print("cube(3) = " + cube(3))
  print("absolute(-7) = " + absolute(-7))
  print("negate(10) = " + negate(10))

  getStatus = function() if isActive then "active" else "inactive" end end
end
