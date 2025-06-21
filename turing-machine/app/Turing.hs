-- | Starting state - 1 \ Ending state -2
module Turing where
data State = Start | Halt | NormalState Int deriving (Eq, Show)
data Symbol = S | Zero | One | Blank deriving (Eq,Show)
type Tape = [Symbol]
data PositionShift = Backwards | Forwards | Stay deriving (Show)

data Instruction = Instruction {
    stateToMatch :: State,
    symbolToMatch :: Symbol,
    newState :: State,
    newSymbol :: Symbol,
    positionShift :: PositionShift
} deriving (Show)

data TuringMachine = TuringMachine {
    states :: [State],
    currentState :: Int,
    tape :: Tape,
    currentPosition :: Int,
    instructions :: [Instruction]
} deriving (Show)

runMachine :: TuringMachine -> TuringMachine
runMachine machine
    | (currentState machine) == Halt = machine
    | otherwise  = runMachine (machineCycle machine)

machineCycle :: TuringMachine -> TuringMachine
machineCycle machine =
    case instructionToApply of
        Just instruction -> applyInstruction machine instruction
        Nothing -> haltMachine machine
    where instructionToApply = findInstructionToApply machine (instructions machine)

haltMachine :: TuringMachine -> TuringMachine
haltMachine machine =
    TuringMachine {
        states = states machine,
        currentState = Halt,
        tape = tape machine,
        currentPosition = currentPosition machine,
        instructions = instructions machine
    }
shouldApplyInstruction :: TuringMachine -> Instruction -> Bool
shouldApplyInstruction machine instruction =
    (currentState machine == stateToMatch instruction) && (currentSymbol machine == symbolToMatch instruction)

currentSymbol :: TuringMachine -> Symbol
currentSymbol machine = (tape machine) !! (currentPosition machine)

findInstructionToApply :: TuringMachine -> [Instruction] -> Maybe Instruction
findInstructionToApply machine instructions
    | null instructions = Nothing
    | shouldApplyInstruction machine (instructions !! 0) =  Just (instructions !! 0)
    | otherwise = findInstructionToApply machine (tail instructions)

applyInstruction :: TuringMachine -> Instruction -> TuringMachine
applyInstruction machine instruction =
    TuringMachine {
        states =  states machine,
        currentState = newState instruction,
        tape = newTape (tape machine) (currentPosition machine) (newSymbol instruction),
        currentPosition = getNewPosition (machine) (positionShift instruction),
        instructions = instructions machine
    }

-- Given a tape, a position in the tape to update and a symbol it creates a new tape
newTape :: Tape -> Int -> Symbol -> Tape
newTape tape position newSymbol =
    take (position) tape ++ newSymbol : drop (position+1) tape

-- This takes a position and a shift and returns a new position
getNewPosition :: TuringMachine -> PositionShift -> Int
getNewPosition machine Forwards = (currentPosition machine) + 1
getNewPosition machine Stay = (currentPosition machine)
getNewPosition machine Backwards
    | (currentPosition machine) == 0 = 0
    | otherwise = (currentPosition machine) - 1

newTuringMachine :: Tape -> [Instruction] -> TuringMachine
newTuringMachine tape instructions = TuringMachine{
        states = [Halt, StartState, A, B, C],
        currentState = StartState,
        tape = [Start] ++ tape ++ repeat Blank,
        currentPosition = 0,
        instructions = instructions
    }
