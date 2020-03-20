NAME = template.exe
CXX = nasm
CXXFLAGS = -f win32
LINKER = golink
LDFLAGS = /entry=_main /fo $(NAME)
LD_LIBRARIES = C:\Windows\system32\user32.dll

SRCDIR = src
OBJDIR = obj

SRC := $(wildcard $(SRCDIR)/*.asm)
OBJ := $(SRC:$(SRCDIR)/%.asm=$(OBJDIR)/%.obj)

.PHONY: all

all: $(NAME)

$(OBJ): $(OBJDIR)/%.obj : $(SRCDIR)/%.asm
	@mkdir $(OBJDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(NAME): $(OBJ)
	$(LINKER) $(LDFLAGS) $^ $(LD_LIBRARIES)

.PHONY: clean
clean:
	rd /s /q $(OBJDIR) 
	del /f $(NAME)